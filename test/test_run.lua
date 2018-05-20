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

assert(#results == #benchmarks)
for i = 1, #results do
  local result = results[i]
  assert(result.name == benchmarks[i][1])
  assert(result.iteration)
  assert(#result == N)
  local x = 1000000 / result.iteration
  local sd, avg = ubench.stdev(result, 1, N)
  local min = ubench.min(result, 1, N)
  local max = ubench.max(result, 1, N)
  if verbose then
    io.stderr:write(("%-13s | %4d | %7.3f | %7.3f | %7.3f\n"):format(result.name, result.iteration, avg * x, min * x, max * x))
  end
end
