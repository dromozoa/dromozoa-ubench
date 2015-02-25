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

local format = string.format
local unpack = table.unpack or unpack

local function run1(n, fn, ctx, ...)
  collectgarbage()
  collectgarbage()

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

local function run2(m, n, fn, ...)
  local data = {}
  for i = 1, m do
    data[i] = run1(n, fn, ...) / n
  end
  table.sort(data)

  local a = math.floor(m / 8)
  local b = math.floor(m * 3 / 8)
  local avg = 0
  for i = a, b do
    avg = avg + data[i]
  end
  avg = avg / (b - a)

  local std = 0
  for i = a, b do
    std = std + (data[i] - avg) ^ 2
  end
  std = std / (b - a)
  std = std ^ 0.5

  return avg, std
end

local function estimate(u, fn, ctx, ...)
  local a = u * 0.9
  local b = u * 1.1
  local n = 1
  while true do
    local t = run1(n, fn, ctx, ...)
    if t < 1 then t = 1 end
    if a <= t and t < b then return n end
    local m = math.floor(n * u / t)
    if m < 1 then m = 1 end
    if n == m then return n end
    n = m
  end
end

local function to_human_readable_duration(u)
  if u < 1 then
    return u * 1000, "nsec"
  elseif u < 1000 then
    return u, "usec"
  elseif u < 1000000 then
    return u * 0.001, "msec"
  else
    return u * 0.000001, "sec"
  end
end

return function ()
  local self = {
    _bench = {};
  }

  function self:add(name, fn, ...)
    local bench = self._bench
    bench[#bench + 1] = {
      name = name;
      fn = fn;
      arg = {...};
    }
  end

  function self:run()
    local filename = os.getenv "DROMOZOA_UBENCH_FILENAME"

    local out = io.stderr
    local result = {}

    local bench = self._bench
    local m = 0
    for i = 1, #bench do
      local v = bench[i]
      local n = #v.name
      if m < n then m = n end
    end

    local fmt = "| %-" .. m .. "s | %5.1f %-4s | %6.2f %% |\n"
    local hr = "+"
    for i = 1, #format(fmt, "", 1, "sec", 1) - 3 do
      hr = hr .. "-"
    end
    hr = hr .. "+\n"

    out:write(hr)
    out:write(format("| %-" .. m .. "s | average    | std/avg  |\n", "name"))
    out:write(hr)

    for i = 1, #bench do
      local v = bench[i]
      local n = estimate(1000, v.fn, unpack(v.arg))
      local avg, std = run2(1000, n, v.fn, unpack(v.arg))
      result[i] = {
        name = v.name;
        avg = avg;
        std = std;
      }
      local a, b = to_human_readable_duration(avg)
      local c = std / avg * 100
      out:write(format(fmt, v.name, a, b, c))
    end

    out:write(hr)
    out:write("\n")

    if filename ~= nil then
      local out = assert(io.open(filename, "a"))
      for i = 1, #result do
        local v = result[i]
        out:write(format("%d\t%s\t%.17g\n", i, v.name, v.avg))
      end
      out:close()
    end
  end

  function self:merge(filename)
    local out = io.stderr
    local result = {}

    local handle = assert(io.open(filename))
    for line in handle:lines() do
      local i, name, avg = assert(line:match("^(%d+)\t([^\t]+)\t([^\t]+)$"))
      local i = tonumber(i)
      local avg = tonumber(avg)
      if result[i] == nil then
        result[i] = { name = name; data = { avg } }
      else
        local data = result[i].data
        data[#data + 1] = avg
      end
    end
    handle:close()

    local m = 0
    for i = 1, #result do
      local v = result[i]
      local n = #v.name
      if m < n then m = n end

      local data = v.data
      table.sort(data)
      v.min = data[1]
      v.max = data[#data]

      local avg = 0
      for i = 1, #data do
        avg = avg + data[i]
      end
      avg = avg / #data
      v.avg = avg
    end

    local fmt = "| %-" .. m .. "s | %5.1f %-4s | %5.1f %-4s | %5.1f %-4s |\n"
    local hr = "+"
    for i = 1, #format(fmt, "", 1, "sec", 1, "sec", 1, "sec") - 3 do
      hr = hr .. "-"
    end
    hr = hr .. "+\n"

    out:write(hr)
    out:write(format("| %-" .. m .. "s | minimum    | average    | maximum    |\n", "name"))
    out:write(hr)

    for i = 1, #result do
      local v = result[i]
      local min_a, min_b = to_human_readable_duration(v.min)
      local avg_a, avg_b = to_human_readable_duration(v.avg)
      local max_a, max_b = to_human_readable_duration(v.max)
      out:write(format(fmt, v.name, min_a, min_b, avg_a, avg_b, max_a, max_b))
    end

    out:write(hr)
    out:write("\n")
  end

  return self
end
