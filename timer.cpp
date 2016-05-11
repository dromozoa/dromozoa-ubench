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

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <time.h>
#include <sys/time.h>

#include <dromozoa/bind.hpp>

#ifdef HAVE_MACH_ABSOLUTE_TIME
#include <mach/mach_time.h>
#endif

namespace dromozoa {
  namespace {
#if defined(HAVE_CLOCK_GETTIME)
    void timer_impl(struct timespec& tv) {
      // clock_gettime(CLOCK_MONOTONIC, &tv);
      clock_gettime(CLOCK_MONOTONIC_RAW, &tv);
      // clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &tv);
    }
#elif defined(HAVE_MACH_ABSOLUTE_TIME)
    void timer_impl(struct timespec& tv) {
      uint64_t t = mach_absolute_time();
      tv.tv_sec = t / 1000000000;
      tv.tv_nsec = t % 1000000000;
    }
#else
    void timer_impl(struct timespec& tv) {
      struct timeval t = {};
      gettimeofday(&tv, 0);
      tv.tv_sec = t.tv_sec;
      tv.tv_nsec = t.tv_usec * 1000;
    }
#endif

    class timer {
    public:
      timer() : tv_() {
        timer_impl(tv_);
      }

      void restart() {
        timer_impl(tv_);
      }

      double elapsed() {
        struct timespec tv = {};
        timer_impl(tv);
        tv.tv_sec -= tv_.tv_sec;
        tv.tv_nsec -= tv_.tv_nsec;
        if (tv.tv_nsec < 0) {
          --tv.tv_sec;
          tv.tv_nsec += 1000000000;
        }
        return tv.tv_sec + tv.tv_nsec * 0.000000001;
      }

    private:
      struct timespec tv_;
      timer(const timer&);
      timer& operator=(const timer&);
    };

    timer* check_timer(lua_State* L, int arg) {
      return luaX_check_udata<timer>(L, arg, "dromozoa.ubench.timer");
    }

    void impl_call(lua_State* L) {
      luaX_new<timer>(L);
      luaX_set_metatable(L, "dromozoa.ubench.timer");
    }

    void impl_restart(lua_State* L) {
      check_timer(L, 1)->restart();
      luaX_push_success(L);
    }

    void impl_elapsed(lua_State* L) {
      luaX_push(L, check_timer(L, 1)->elapsed());
    }
  }

  void initialize_timer(lua_State* L) {
    lua_newtable(L);
    {
      luaL_newmetatable(L, "dromozoa.ubench.timer");
      lua_pushvalue(L, -2);
      luaX_set_field(L, -2, "__index");
      lua_pop(L, 1);

      luaX_set_metafield(L, -1, "__call", impl_call);
      luaX_set_field(L, -1, "restart", impl_restart);
      luaX_set_field(L, -1, "elapsed", impl_elapsed);
    }
    luaX_set_field(L, -2, "timer");
  }
}
