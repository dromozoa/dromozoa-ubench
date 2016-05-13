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

#include <alloca.h>
#include <errno.h>
#include <string.h>
#include <sys/mman.h>

#include <dromozoa/bind.hpp>

namespace dromozoa {
  namespace {
    void impl_mlockall(lua_State* L) {
      int flags = luaX_check_integer<int>(L, 1);
      size_t size = luaX_opt_integer<size_t>(L, 2, 8192);

      if (mlockall(flags) == -1) {
        luaX_push(L, luaX_nil);
        luaX_push(L, errno);
      } else {
        luaX_push_success(L);
      }

      // char buffer[8192];
      char* buffer = static_cast<char*>(alloca(size));
      memset(buffer, 0, size);
    }

    void impl_munlockall(lua_State* L) {
      if (munlockall() == -1) {
        luaX_push(L, luaX_nil);
        luaX_push(L, errno);
      } else {
        luaX_push_success(L);
      }
    }
  }

  void initialize_sched(lua_State* L);
  void initialize_sys_sysinfo(lua_State* L);
  void initialize_timer(lua_State* L);

  void initialize(lua_State* L) {
    initialize_sched(L);
    initialize_sys_sysinfo(L);
    initialize_timer(L);

    luaX_set_field(L, -1, "mlockall", impl_mlockall);
    luaX_set_field(L, -1, "munlockall", impl_munlockall);
    luaX_set_field(L, -1, "MCL_CURRENT", MCL_CURRENT);
    luaX_set_field(L, -1, "MCL_FUTURE", MCL_FUTURE);
  }
}

extern "C" int luaopen_dromozoa_ubench(lua_State* L) {
  lua_newtable(L);
  dromozoa::initialize(L);
  return 1;
}
