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
#include <sys/time.h>

#include <lua.h>
#include <lualib.h>

static int impl_gettimeofday(lua_State* L) {
  struct timeval tv = {};
  if (gettimeofday(&tv, 0) != -1) {
    lua_newtable(L);
    lua_pushinteger(L, tv.tv_sec);
    lua_setfield(L, -2, "tv_sec");
    lua_pushinteger(L, tv.tv_usec);
    lua_setfield(L, -2, "tv_usec");
    return 1;
  } else {
    int code = errno;
    lua_pushnil(L);
    lua_pushfstring(L, "could not gettimeofday: %s", strerror(code));
    lua_pushinteger(L, code);
    return 3;
  }
}

int luaopen_dromozoa_ubench_gettimeofday(lua_State* L) {
  lua_pushcfunction(L, impl_gettimeofday);
  return 1;
}
