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

local unix = require "dromozoa.unix"
local stdev = require "dromozoa.ubench.stdev"

local function run(n, f)
  local timer = unix.timer()

  collectgarbage()
  collectgarbage()

  timer:start()
  for i = 1, n do
    f()
  end
  timer:stop()

  return timer:elapsed() * 1000000
end

local function estimate(u, f)
  local a = u * 0.99
  local b = u * 1.01
  local n = 1
  while true do
    local t = run(n, f)
    if a <= t and t < b then
      return n
    end
    if t < 1 then t = 1 end
    local m = n * u / t
    m = m - m % 1
    if m < 1 then m = 1 end
    if n == m then
      return n
    end
    n = m
  end
end

return function (F, m, u)
  local N = {}
  local T = {}

  for i = 1, #F do
    N[i] = estimate(u, F[i])
    T[i] = {}
  end

  for j = 1, m do
    for i = 1, #F do
      local n = N[i]
      T[i][j] = run(n, F[i]) / n
      unix.nanosleep { tv_sec = 0; tv_nsec = 1000000 }
    end
    io.stderr:write(j, "/", m, "\n")
    unix.nanosleep { tv_sec = 0; tv_nsec = 1000000 }
  end

  local a = m / 8
  local b = a * 3
  a = a - a % 1
  b = b - b % 1

  local R = {}
  for i = 1, #T do
    table.sort(T[i])
    R[i] = { stdev.s(T[i], a, b) }
  end

  return R
end
