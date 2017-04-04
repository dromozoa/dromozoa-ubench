-- Copyright (C) 2016,2017 Tomoyuki Fujimori <moyu@dromozoa.com>
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

local ipairs = require "dromozoa.commons.ipairs"
local json = require "dromozoa.commons.json"
local sequence = require "dromozoa.commons.sequence"
local uint32 = require "dromozoa.commons.uint32"

local unix = require "dromozoa.unix"
local max = require "dromozoa.ubench.max"
local min = require "dromozoa.ubench.min"
local stdev = require "dromozoa.ubench.stdev"

local function fibonacci(n)
  if n < 2 then
    return n
  else
    return fibonacci(n - 2) + fibonacci(n - 1)
  end
end

local function tarai(x, y, z)
  if x <= y then
    return y
  else
    return tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y))
  end
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

local function f()
  return fibonacci(5)
end

-- local n = estimate(0.001, f, {}, 2)
local n = 200
local N = 1000

local pid = unix.getpid()
local options = {}
local comments = sequence()

for _, v in ipairs(arg) do
  options[v] = true
  comments:push(v)
end

if options.scheduler then
  local param = {
    sched_priority = unix.sched_get_priority_min(unix.SCHED_FIFO);
  }
  assert(unix.sched_setscheduler(pid, unix.SCHED_FIFO, param))
end

if options.affinity then
  local affinity = unix.sched_getaffinity(pid)
  print(json.encode(affinity))
  assert(unix.sched_setaffinity(pid, { 3 }))
end

if options.mlockall then
  assert(unix.mlockall(uint32.bor(unix.MCL_CURRENT, unix.MCL_FUTURE)))
end

if options.reserve_stack_pages then
  assert(unix.reserve_stack_pages(8192))
end

local data = {}
for i = 1, N do
  data[i] = run(n, f, {}, 2)
end

if options.mlockall then
  assert(unix.munlockall())
end

-- print("min", min(data))
-- print("max", max(data))
-- print("stdev.p", stdev.p(data))
-- print("stdev.s", stdev.s(data))

table.sort(data)

local now = os.date("%Y%m%d%H%M%S")
local out = assert(io.open("data-" .. now .. ".txt", "w"))
out:write("#", comments:push(now):concat(" "), "\n")
for i = 1, N do
  if options.yield then
    unix.sched_yield()
  end
  out:write(("%.17g\n"):format(data[i]))
end
out:close()
