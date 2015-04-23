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

local gettimeofday = require "dromozoa.ubench.gettimeofday"
local stdev = require "dromozoa.ubench.stdev"

local function run(n, f)
  collectgarbage()
  collectgarbage()

  local tv1 = gettimeofday()
  for i = 1, n do
    f()
  end
  local tv2 = gettimeofday()

  local s = tv2.tv_sec - tv1.tv_sec
  local u = tv2.tv_usec - tv1.tv_usec
  if u < 0 then
    s = s - 1
    u = u + 1000000
  end
  return s * 1000000 + u
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
    end
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
