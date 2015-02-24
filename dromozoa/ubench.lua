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

local collectgarbage = collectgarbage
local floor = math.floor
local format = string.format
local unpack = table.unpack

local function ubench_run(n, fn, ctx, ...)
  collectgarbage("collect")
  collectgarbage("collect")

  local t1 = gettimeofday()
  for i = 1, n do
    ctx = fn(ctx, ...)
  end
  local t2 = gettimeofday()

  local s = t2.tv_sec - t1.tv_sec
  local u = t2.tv_usec - t1.tv_usec
  if u < 0 then
    s = s - 1
    u = u + 1000000
  end
  return s * 1000000 + u
end

local function ubench_n(u, fn, ctx, ...)
  local a = u * 0.9
  local b = u * 1.1
  local n = 1
  while true do
    local t = ubench_run(n, fn, ctx, ...)
    if t < 1 then t = 1 end
    if a <= t and t < b then return n end
    local m = floor(n * u / t)
    if m < 1 then m = 1 end
    if n == m then return n end
    n = m
  end
end

return function ()
  local self = {
    _bench = {};
    _n = 1000;
  }

  function self:add(name, fn, ...)
    local cycle = ubench_n(1000, fn, ...)
    io.stderr:write(format("bench[%q].cycle = %d\n", name, cycle))

    local bench = self._bench
    bench[#bench + 1] = {
      name = name;
      fn = fn;
      arg = {...};
      cycle = cycle;
    }
  end

  function self:run()
    for i = 1, #self._bench do
      local v = self._bench[i]
      io.stderr:write(format("running[%q]...\n", v.name))
      local data = {}
      for j = 1, self._n do
        data[j] = ubench_run(v.cycle, v.fn, unpack(v.arg))
      end

      table.sort(data)

      local a = math.max(math.floor(#data * 1 / 8), 1)
      local b = math.max(math.floor(#data * 3 / 8), 1)
      assert(a < b)
      local x = 0
      for i = a, b do
        x = x + data[i]
      end
      x = x / (b - a)

      local y = 0
      for i = a, b do
        y = y + (data[i] - x) ^ 2
      end
      y = y / (b - a)
      y = y ^ 0.5

      local z = y / x * 100
      local x = x / v.cycle
      io.write(format("%9.4f %5.2f%%\n", x, z))
    end
  end

  return self
end
