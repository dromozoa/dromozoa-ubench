/*
 * Copyright (C) 2015 Tomoyuki Fujimori <moyu@dromozoa.com>
 *
 * This file is part of dromozoa-ubench.
 *
 * dromozoa-ubench is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * dromozoa-ubench is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with dromozoa-ubench.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <errno.h>
#include <string.h>
#include <sys/resource.h>
#include <sys/time.h>

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

static void push_timeval(lua_State* L, const struct timeval* tv) {
  lua_newtable(L);
  lua_pushinteger(L, tv->tv_sec);
  lua_setfield(L, -2, "tv_sec");
  lua_pushinteger(L, tv->tv_usec);
  lua_setfield(L, -2, "tv_usec");
}

static int impl_getrusage(lua_State* L) {
  int who = luaL_checkinteger(L, 1);
  struct rusage ru;
  if (getrusage(who, &ru) != -1) {
    lua_newtable(L);
    push_timeval(L, &ru.ru_utime);
    lua_setfield(L, -2, "ru_utime");
    push_timeval(L, &ru.ru_stime);
    lua_setfield(L, -2, "ru_stime");
    return 1;
  } else {
    lua_pushboolean(L, 0);
    lua_pushfstring(L, "could not getrusage: %s", strerror(errno));
    return 2;
  }
}

static int impl_gettimeofday(lua_State* L) {
  struct timeval tv;
  if (gettimeofday(&tv, 0) != -1) {
    push_timeval(L, &tv);
    return 1;
  } else {
    lua_pushboolean(L, 0);
    lua_pushfstring(L, "could not gettimeofday: %s", strerror(errno));
    return 2;
  }
}

static const luaL_Reg module[] = {
  { "getrusage", impl_getrusage },
  { "gettimeofday", impl_gettimeofday },
  { },
};

int luaopen_dromozoa_ubench(lua_State* L) {
  luaL_newlib(L, module);
  lua_pushinteger(L, RUSAGE_SELF);
  lua_setfield(L, -2, "RUSAGE_SELF");
  lua_pushinteger(L, RUSAGE_CHILDREN);
  lua_setfield(L, -2, "RUSAGE_CHILDREN");
  return 1;
}
