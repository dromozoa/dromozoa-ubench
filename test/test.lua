-- Copyright (C) 2018 Tomoyuki Fujimori <moyu@dromozoa.com>
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

local verbose = os.getenv "VERBOSE" == "1"

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

local epsilon = 0.000001

local function equal(a, b)
  if a == b then
    return true
  else
    local ta = type(a)
    local tb = type(b)
    if ta == "number" and tb == "number" then
      return a - epsilon < b and b < a + epsilon
    elseif ta == "table" and tb == "table" then
      for k, u in pairs(a) do
        local v = b[k]
        if v == nil or not equal(u, v) then
          return false
        end
      end
      for k in pairs(b) do
        if a[k] == nil then
          return false
        end
      end
      return true
    else
      return false
    end
  end
end

local T = 0.001
local N = 1000

local benchmarks = {}
for i = 4, 7 do
  benchmarks[#benchmarks + 1] = { ("fibonacci(%d)"):format(i), function (context, n) return context + fibonacci(n) end, 0, i }
end
for i = 4, 7 do
  benchmarks[#benchmarks + 1] = { ("tarai(%2d,%d,%d)"):format(i * 2, i, i), function (context, x, y, z) return context + tarai(x, y, z)  end, 0, i * 2, i, i }
end

local context = ubench.context()
context:initialize()
local results = ubench.run(T, N, benchmarks)
context:terminate()

local out = assert(io.open("test.dat", "w"))
ubench.dump(out, results)
out:close()

local results2 = assert(assert(loadfile "test.dat")())
assert(equal(results, results2))

ubench.report(results, "test.dir")
