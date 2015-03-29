#include <stdint.h>
#include <stdlib.h>
#include <sys/time.h>
#include <iomanip>
#include <iostream>

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

  struct timeval tv0 = {};
  struct timeval tv1 = {};

  gettimeofday(&tv0, 0);
  int r = tarai(x, y, z);
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
  return 0;
}
