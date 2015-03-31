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

int main(int argc, char* argv[]) {
  if (argc < 4) {
    return 1;
  }
  int x = atoi(argv[1]);
  int y = atoi(argv[2]);
  int z = atoi(argv[3]);

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

  REPORT(ActiveAverageFrequency);
  REPORT(ActiveRelativeFrequency);
  REPORT(AverageFrequency);
  REPORT(Cycles);
  REPORT(CyclesLostDueL2CacheMisses);
  REPORT(CyclesLostDueL3CacheMisses);
  REPORT(ExecUsage);
  REPORT(IPC);
  REPORT(InstructionsRetired);
  REPORT(InvariantTSC);
  REPORT(L2CacheHitRatio);
  REPORT(L2CacheHits);
  REPORT(L2CacheMisses);
  REPORT(L3CacheHitRatio);
  REPORT(L3CacheHits);
  REPORT(L3CacheHitsNoSnoop);
  REPORT(L3CacheHitsSnoop);
  REPORT(L3CacheMisses);
  REPORT(RefCycles);
  REPORT(RelativeFrequency);

#undef REPORT

  for (int i = 0; i < PCM::MAX_C_STATE; ++i) {
    std::cout << "CoreCStateResidency[" << i << "]\t" << getCoreCStateResidency(i, s0, s1) << "\n";
  }

  pcm->resetPMU();

  return 0;
}
