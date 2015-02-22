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

local timeval = require "dromozoa.ubench.timeval"

local tv0 = timeval { tv_sec = 0, tv_usec = 0 }
local tv1 = timeval { tv_sec = 1, tv_usec = 250000 }
local tv2 = timeval { tv_sec = -2, tv_usec = 750000 }

assert(tv0 == tv1 + tv2)
assert(tv1 + 0 == 1.25)
assert(0 + tv2 == -1.25)

assert(tv0 - tv1 == tv2)
assert(tv1 - 0 == 1.25)
assert(0 - tv2 == 1.25)

assert(-tv1 == tv2)
assert(tv1 == -tv2)

assert(tv0 < tv1)
assert(tv1 > tv0)

assert(tv0 <= tv1)
assert(tv1 >= tv0)

assert(tostring(tv0) == "0.000000")
assert(tostring(tv1) == "1.250000")
assert(tostring(tv2) == "-1.250000")
