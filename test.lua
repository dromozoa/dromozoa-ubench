-- Copyright (C) 2015 Tomoyuki Fujimori <moyu@dromozoa.com>
--
-- This file is part of dromozoa-ubench.
--
-- dromozoa-ubench is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- dromozoa-ubench is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with dromozoa-ubench.  If not, see <http://www.gnu.org/licenses/>.

local ubench = require "dromozoa.ubench"
local timeval = require "dromozoa.ubench.timeval"
local tarai = ubench.tarai

assert(ubench.RUSAGE_SELF)
assert(ubench.RUSAGE_CHILDREN)

local tv1 = ubench.gettimeofday()
local ru1 = ubench.getrusage(ubench.RUSAGE_SELF)

tarai(8, 4, 0)

local tv2 = ubench.gettimeofday()
local ru2 = ubench.getrusage(ubench.RUSAGE_SELF)

print("tv", timeval(tv2) - timeval(tv1))
print("ut", timeval(ru2.ru_utime) - timeval(ru1.ru_utime))
print("st", timeval(ru2.ru_stime) - timeval(ru1.ru_stime))
