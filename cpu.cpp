// Copyright (C) 2016 Tomoyuki Fujimori <moyu@dromozoa.com>
//
// This file is part of dromozoa-ubench.
//
// dromozoa-ubench is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// dromozoa-ubench is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with dromozoa-ubench.  If not, see <http://www.gnu.org/licenses/>.

#include <sys/sysinfo.h>

#include <dromozoa/bind.hpp>

namespace dromozoa {
  namespace {
    void impl_get_nprocs(lua_State* L) {
      luaX_push(L, get_nprocs());
    }

    void impl_get_nprocs_conf(lua_State* L) {
      luaX_push(L, get_nprocs_conf());
    }
  }

  void initialize_cpu(lua_State* L) {
    luaX_set_field(L, -1, "get_nprocs", impl_get_nprocs);
    luaX_set_field(L, -1, "get_nprocs_conf", impl_get_nprocs_conf);
  }
}
