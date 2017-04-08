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

  local i = 1
  for key, result in pairs(results) do
    local iteration = result.iteration
    local data = sequence()
    for v in result.data:each() do
      data:push(v * 1000000 / iteration)
    end

    local out = assert(io.open(("ubench-data-%04d.txt"):format(i), "w"))
    out:write("#ubench-data-", key, "\n")
    for v in data:each() do
      out:write(v, "\n")
    end
    out:close()

    data:sort()

    local out = assert(io.open(("ubench-sort-%04d.txt"):format(i), "w"))
    out:write("#ubench-sort-", key, "\n")
    for v in data:each() do
      out:write(v, "\n")
    end
    out:close()

    local n = #data
    local m = n * 0.2
    m = m - m % 1

    local min = min(data, m + 1, n - m)
    local max = max(data, m + 1, n - m)
    local sd, avg = stdev(data, m + 1, n - m)
    io.write(key, "\t", min, "\t", max, "\t", avg, "\t", sd, "\n")

    i = i + 1
  end
end
