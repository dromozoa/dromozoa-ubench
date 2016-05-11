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

#include <errno.h>
#include <sched.h>

#include <dromozoa/bind.hpp>

namespace dromozoa {
  namespace {
    void impl_getaffinity(lua_State* L) {
      pid_t pid = luaX_check_integer<pid_t>(L, 1);
      cpu_set_t mask;
      CPU_ZERO(&mask);
      if (sched_getaffinity(pid, sizeof(mask), &mask) == -1) {
        luaX_push(L, luaX_nil);
        luaX_push(L, errno);
      } else {
        lua_newtable(L);
        int i = 0;
        int n = CPU_COUNT(&mask);
        for (int cpu = 0; i < n; ++cpu) {
          if (CPU_ISSET(cpu, &mask)) {
            ++i;
            luaX_set_field(L, -1, i, cpu);
          }
        }
      }
    }

    void impl_setaffinity(lua_State* L) {
      pid_t pid = luaX_check_integer<pid_t>(L, 1);
      cpu_set_t mask;
      CPU_ZERO(&mask);
      if (lua_istable(L, 2)) {
        for (int i = 1; ; ++i) {
          luaX_get_field(L, 2, i);
          if (lua_isnumber(L, -1)) {
            int cpu = lua_tointeger(L, -1);
            lua_pop(L, 1);
            CPU_SET(cpu, &mask);
          } else {
            lua_pop(L, 1);
            break;
          }
        }
      }
      if (sched_setaffinity(pid, sizeof(mask), &mask) == -1) {
        luaX_push(L, luaX_nil);
        luaX_push(L, errno);
      } else {
        luaX_push_success(L);
      }
    }

    void impl_get_priority_min(lua_State* L) {
      int policy = luaX_check_integer<int>(L, 1);
      int result = sched_get_priority_min(policy);
      if (result == -1) {
      } else {
        luaX_push(L, result);
      }
    }

    void impl_get_priority_max(lua_State* L) {
      int policy = luaX_check_integer<int>(L, 1);
      int result = sched_get_priority_max(policy);
      if (result == -1) {
      } else {
        luaX_push(L, result);
      }
    }

    void impl_setscheduler(lua_State* L) {
      pid_t pid = luaX_check_integer<pid_t>(L, 1);
      int policy = luaX_check_integer<int>(L, 2);
      int priority = luaX_check_integer<int>(L, 3);
      struct sched_param param = {};
      param.sched_priority = priority;
      if (sched_setscheduler(pid, policy, &param) == -1) {
      } else {
        luaX_push_success(L);
      }
    }
  }

  void initialize_sched(lua_State* L) {
    luaX_set_field(L, -1, "getaffinity", impl_getaffinity);
    luaX_set_field(L, -1, "setaffinity", impl_setaffinity);
    luaX_set_field(L, -1, "get_priority_min", impl_get_priority_min);
    luaX_set_field(L, -1, "get_priority_max", impl_get_priority_max);
    luaX_set_field(L, -1, "setscheduler", impl_setscheduler);
    luaX_set_field(L, -1, "SCHED_OTHER", SCHED_OTHER);
    luaX_set_field(L, -1, "SCHED_BATCH", SCHED_BATCH);
    luaX_set_field(L, -1, "SCHED_IDLE", SCHED_IDLE);
    luaX_set_field(L, -1, "SCHED_FIFO", SCHED_FIFO);
    luaX_set_field(L, -1, "SCHED_RR", SCHED_RR);
  }
}
