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

local pairs = require "dromozoa.commons.pairs"
local sequence = require "dromozoa.commons.sequence"
local max = require "dromozoa.ubench.max"
local min = require "dromozoa.ubench.min"
local stdev = require "dromozoa.ubench.stdev"

return function (results, dir)
  if dir == nil then
    dir = "."
  end

  local dataset = sequence()

  local i = 1
  for key, result in pairs(results) do
    local iteration = result.iteration
    local sample = sequence()
    for v in result.data:each() do
      sample:push(v * 1000000 / iteration)
    end

    local out = assert(io.open(("%s/sample-%04d.txt"):format(dir, i), "w"))
    out:write("#sample-", key, "\n")
    for v in sample:each() do
      out:write(v, "\n")
    end
    out:close()

    sample:sort()

    local out = assert(io.open(("%s/sorted-%04d.txt"):format(dir, i), "w"))
    out:write("#sorted-", key, "\n")
    for v in sample:each() do
      out:write(v, "\n")
    end
    out:close()

    local n = #sample
    local m = n * 0.2
    m = m - m % 1

    local data = {
      key = key;
      min = min(sample, m + 1, n - m);
      max = max(sample, m + 1, n - m);
    }
    data.sd, data.avg = stdev(sample, m + 1, n - m)
    dataset:push(data)

    i = i + 1
  end

  local out = assert(io.open(("%s/report.txt"):format(dir), "w"))
  out:write("key\tavg\tmin\tmax\tcv\tsd\n")
  for data in dataset:each() do
    out:write(("%s\t%.17g\t%.17g\t%.17g\t%.17g\t%.17g\n"):format(data.key, data.avg, data.min, data.max, data.sd / data.avg, data.sd))
  end
  out:close()
end
