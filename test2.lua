-- Copyright (C) 2016 Tomoyuki Fujimori <moyu@dromozoa.com>
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

local function run(n, f, context, ...)
  local timer = unix.timer()

  collectgarbage()
  collectgarbage()

  timer:start()
  for i = 1, n do
    context = f(context, ...)
  end
  timer:stop()

  return timer:elapsed()
end

local function estimate(t, f, context, ...)
  local a = t * 0.99
  local b = t * 1.01
  local n = 1
  while true do
    local elapsed = run(n, f, context, ...)
    print(n, elapsed)
    if a <= elapsed and elapsed < b then
      return n
    end
    local m = n * t / elapsed
    if m < 1 then
      m = 1
    end
    if n == m then
      return n
    end
    n = m
  end
end

local n = estimate(0.001, f, {}, 2)
local N = 1000

local data = {}
for i = 1, N do
  data[i] = run(n, f, {}, 2)
end

for i = 1, N do
  -- print(data[i])
end
