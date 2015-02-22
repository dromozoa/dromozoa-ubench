package = "dromozoa-ubench"
version = "1.0-1"
source = {
  url = "https://github.com/dromozoa/dromozoa-ubench/archive/v1.0.tar.gz";
  file = "dromozoa-ubench-1.0.tar.gz";
}
description = {
  summary = "Microbenchmark utility";
  license = "GPL-3";
  homepage = "https://github.com/dromozoa/dromozoa-ubench/";
  maintainer = "Tomoyuki Fujimori <moyu@dromozoa.com>";
}
build = {
  type = "builtin";
  modules = {
    ["dromozoa.ubench"] = "dromozoa/ubench.c";
    ["dromozoa.ubench.tarai"] = "dromozoa/ubench/tarai.lua";
    ["dromozoa.ubench.timeval"] = "dromozoa/ubench/timeval.lua";
  };
}
