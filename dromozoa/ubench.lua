-- Copyright (C) 2017 Tomoyuki Fujimori <moyu@dromozoa.com>
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

local linked_hash_table = require "dromozoa.commons.linked_hash_table"
local pack = require "dromozoa.commons.pack"
local sequence = require "dromozoa.commons.sequence"
local translate_range = require "dromozoa.commons.translate_range"
local uint32 = require "dromozoa.commons.uint32"
local unpack = require "dromozoa.commons.unpack"
local unix = require "dromozoa.unix"

local function average(data, i, j)
  local u = 0
  for i = i, j do
    u = u + data[i]
  end
  return u / (j - i + 1)
end

local function stdev(data, i, j, n)
  local a = average(data, i, j)
  local u = 0
  for i = i, j do
    local v = data[i] - a
    u = u + v * v
  end
  return (u / n) ^ 0.5, a
end

local function stdev_s(data, i, j)
  local min, max = translate_range(#data, i, j)
  return stdev(data, min, max, max - min)
end

local function stdev_p(data, i, j)
  local min, max = translate_range(#data, i, j)
  return stdev(data, min, max, max - min + 1)
end

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

local class = {}

function class.prologue(profile)
  if profile ~= "rpi3" then
    return
  end
  local pid = assert(unix.getpid())
  local context = {
    affinity = assert(unix.sched_getaffinity(pid));
    scheduler = assert(unix.sched_getscheduler(pid));
    param = assert(unix.sched_getparam(pid));
  }
  assert(unix.sched_setaffinity(pid, { 3 }))
  assert(unix.sched_setscheduler(pid, unix.SCHED_FIFO, {
    sched_priority = assert(unix.sched_get_priority_max(unix.SCHED_FIFO)) - 1;
  }))
  assert(unix.mlockall(uint32.bor(unix.MCL_CURRENT, unix.MCL_FUTURE)))
  return context
end

function class.epilogue(context)
  if context == nil then
    return
  end
  local pid = assert(unix.getpid())
  assert(unix.sched_setaffinity(pid, context.affinity))
  assert(unix.sched_setscheduler(pid, context.scheduler, context.param))
  assert(unix.munlockall())
end

function class.new()
  return {
    T = 0.001;
    N = 1000;
    M1 = 101;
    M2 = 900;
    benchmarks = linked_hash_table();
  }
end

function class:add(key, ...)
  self.benchmarks[key] = pack(...)
end

function class:run()
  local T = self.T
  local N = self.N
  local M1 = self.M1
  local M2 = self.M2
  local results = sequence()
  for k, v in self.benchmarks:each() do
    local n = estimate(T, unpack(v, 1, v.n))
    local result = sequence()
    for i = 1, N do
      result:push(run(n, unpack(v, 1, v.n)) / n)
    end
    result:sort()
    local s, a = stdev_s(result, M1, M2)
    results:push({ k, s, a })
  end
  return results
end


class.metatable = {
  __index = class;
}

return setmetatable(class, {
  __call = function ()
    return setmetatable(class.new(), class.metatable)
  end;
})
