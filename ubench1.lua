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
local tarai = require "dromozoa.ubench.tarai"
local timeval = require "dromozoa.ubench.timeval"

function run()
  -- 64 - 448
  -- C = 8
  -- 1/(C*2) (C-1)/(C*2)

  local N = 1024
  local R1 = 64
  local R2 = 448

  local total = {}
  local user = {}
  local system = {}

  for i = 1, N do
    collectgarbage("collect")
    collectgarbage("stop")

    local t1 = ubench.gettimeofday()
    local u1 = ubench.getrusage(ubench.RUSAGE_SELF)
    tarai(9, 4, 0)
    local t2 = ubench.gettimeofday()
    local u2 = ubench.getrusage(ubench.RUSAGE_SELF)

    collectgarbage("collect")
    collectgarbage("restart")

    total[i] = timeval(t2) - timeval(t1) + 0
    user[i] = timeval(u2.ru_utime) - timeval(u1.ru_utime) + 0
    system[i] = timeval(u2.ru_stime) - timeval(u1.ru_stime) + 0
  end

  table.sort(total)

  local a = 0
  for i = R1, R2 do
    a = a + total[i]
  end
  a = a / (R2 - R1 + 1)

  local b = 0
  for i = R1, R2 do
    b = b + (total[i] - a) ^ 2
  end
  b = b ^ 0.5

  print(string.format("%.6f %.1f%%", a, b * 100))
end

run()
