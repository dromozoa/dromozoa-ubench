-- Copyright (C) 2017,2018 Tomoyuki Fujimori <moyu@dromozoa.com>
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
local max = require "dromozoa.ubench.max"
local min = require "dromozoa.ubench.min"
local stdev = require "dromozoa.ubench.stdev"

return function (results, dir)
  if dir then
    local result, message, code = unix.mkdir(dir)
    if not result then
      if code == unix.EEXIST then
        if unix.band(unix.stat(dir).st_mode, unix.S_IFMT) ~= unix.S_IFDIR then
          error(unix.strerror(unix.ENOTDIR))
        end
      else
        error(message)
      end
    end
  else
    dir = "."
  end

  local dataset = {}
  for i = 1, #results do
    local result = results[i]
    local iteration = result.iteration
    local samples = {}
    for j = 1, #result do
      samples[j] = result[j] * 1000000 / iteration
    end

    -- write_png
    table.sort(samples)
    -- write_png

    local n = #samples
    local m = n * 0.25
    m = m - m % 1

    n = n - m
    m = m + 1

    local data = {
      name = result.name;
      min = min(samples, m, n);
      max = max(samples, m, n);
    }
    data.sd, data.avg = stdev(samples, m, n)

    dataset[i] = data
  end

  local out = assert(io.open(("%s/report.txt"):format(dir), "w"))
  out:write "key\tavg\tmin\tmax\tcv\tsd\n"
  for i = 1, #dataset do
    local data = dataset[i]
    out:write(("%s\t%.17g\t%.17g\t%.17g\t%.17g\t%.17g\n"):format(data.name, data.avg, data.min, data.max, data.sd / data.avg, data.sd))
  end
  out:close()

  return dataset
end
