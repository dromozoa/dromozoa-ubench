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
local unpack = require "dromozoa.commons.unpack"
local unix = require "dromozoa.unix"
local context = require "dromozoa.ubench.context"
local stdev = require "dromozoa.ubench.stdev"

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

function class.initialize()
  return context():initialize()
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
    local s, a = stdev(result, M1, M2)
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
