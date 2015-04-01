#include <stdint.h>
#include <stdlib.h>
#include <sys/time.h>
#include <iomanip>
#include <iostream>

#include <cpucounters.h>

int tarai(int x, int y, int z) {
  if (x <= y) {
    return y;
  } else {
    return tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y));
  }
}

int run1(int x, int y, int z) {
  PCM* pcm = PCM::getInstance();
  PCM::ErrorCode ec = pcm->program();

  if (ec != PCM::Success) {
    if (ec == PCM::PMUBusy) {
      pcm->resetPMU();
    } else {
      std::cerr << "pcm->program() failed: " << ec << "\n";
      return 1;
    }
  }

  struct timeval tv0 = {};
  struct timeval tv1 = {};

  gettimeofday(&tv0, 0);
  SystemCounterState s0 = getSystemCounterState();
  int r = tarai(x, y, z);
  SystemCounterState s1 = getSystemCounterState();
  gettimeofday(&tv1, 0);

  int64_t s = tv1.tv_sec;
  int32_t u = tv1.tv_usec;
  if (u < tv0.tv_usec) {
    --s;
    u += 1000000;
  }
  s -= tv0.tv_sec;
  u -= tv0.tv_usec;

  std::cout << std::setfill('0') << s << "." << std::setw(6) << u << "\t" << r << "\n";

#define REPORT(name) \
  std::cout << #name << "\t" << get ## name (s0, s1) << "\n";

  // Computes average core frequency when not in powersaving C0-state (also taking Intel Turbo Boost technology into account)
  REPORT(ActiveAverageFrequency);
  // Computes average core frequency when not in powersaving C0-state (also taking Intel Turbo Boost technology into account)
  REPORT(ActiveRelativeFrequency);
  // Computes average core frequency also taking Intel Turbo Boost technology into account.
  REPORT(AverageFrequency);
  // Computes the number core clock cycles when signal on a specific core is running (not halted)
  REPORT(Cycles);
  // Estimates how many core cycles were potentially lost due to missing L2 cache but still hitting L3 cache.
  REPORT(CyclesLostDueL2CacheMisses);
  // Estimates how many core cycles were potentially lost due to L3 cache misses.
  REPORT(CyclesLostDueL3CacheMisses);
  // Computes average number of retired instructions per time interval.
  REPORT(ExecUsage);
  // Computes average number of retired instructions per core cycle (IPC)
  REPORT(IPC);
  // Computes the number of retired instructions.
  REPORT(InstructionsRetired);
  // Computes number of invariant time stamp counter ticks.
  REPORT(InvariantTSC);
  REPORT(L2CacheHitRatio);
  REPORT(L2CacheHits);
  REPORT(L2CacheMisses);
  REPORT(L3CacheHitRatio);
  REPORT(L3CacheHits);
  // Computes number of L3 cache hits where no snooping in sibling L2 caches had to be done.
  REPORT(L3CacheHitsNoSnoop);
  // Computes number of L3 cache hits where snooping in sibling L2 caches had to be done.
  REPORT(L3CacheHitsSnoop);
  REPORT(L3CacheMisses);
  // Computes the number of reference clock cycles while clock signal on the core is running.
  REPORT(RefCycles);
  // Computes average core frequency also taking Intel Turbo Boost technology into account.
  REPORT(RelativeFrequency);

#undef REPORT

  // Computes residency in the core C-state.
  for (int i = 0; i < PCM::MAX_C_STATE; ++i) {
    std::cout << "CoreCStateResidency[" << i << "]\t" << getCoreCStateResidency(i, s0, s1) << "\n";
  }

  pcm->resetPMU();
  return 0;
}

int run2(int x, int y, int z) {
  PCM* pcm = PCM::getInstance();
  PCM::ErrorCode ec = pcm->program();

  if (ec != PCM::Success) {
    if (ec == PCM::PMUBusy) {
      pcm->resetPMU();
    } else {
      std::cerr << "pcm->program() failed: " << ec << "\n";
      return 1;
    }
  }

  struct timeval tv0 = {};
  struct timeval tv1 = {};

  for (int i = 0; i < 1000; ++i) {
    gettimeofday(&tv0, 0);
    SystemCounterState s0 = getSystemCounterState();
    tarai(x, y, z);
    SystemCounterState s1 = getSystemCounterState();
    gettimeofday(&tv1, 0);

    int64_t s = tv1.tv_sec;
    int32_t u = tv1.tv_usec;
    if (u < tv0.tv_usec) {
      --s;
      u += 1000000;
    }
    s -= tv0.tv_sec;
    u -= tv0.tv_usec;

    std::cout << std::setfill('0') << s << "." << std::setw(6) << u;

#define REPORT(name) \
    std::cout << "\t" << get ## name (s0, s1);

    REPORT(Cycles);
    REPORT(ExecUsage);
    REPORT(IPC);
    REPORT(InstructionsRetired);
    REPORT(InvariantTSC);
    REPORT(L2CacheHitRatio);
    REPORT(L3CacheHitRatio);
    REPORT(RefCycles);

#undef REPORT

    std::cout << "\n";
  }

  pcm->resetPMU();
  return 0;
}

int main(int argc, char* argv[]) {
  if (argc < 4) {
    return 1;
  }
  int x = atoi(argv[1]);
  int y = atoi(argv[2]);
  int z = atoi(argv[3]);
  return run2(x, y, z);
}
