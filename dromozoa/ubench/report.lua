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

local result, png = pcall(require, "dromozoa.png")
if result then
  write_png = function (filename, samples, data)
    local width = #samples
    local height = 256

    local rows = {}
    for y = 1, height do
      local row = {}
      for x = 1, width do
        row[x] = "\0"
      end
      rows[y] = row
    end

    local m = data.min
    local n = data.max - m

    for x = 1, width do
      local u = (samples[x] - m) * height / n
      local v = u % 1
      u = u - v
      for y = height - u + 1, height do
        rows[y][x] = "\255"
      end
      if v ~= 0 then
        rows[height - u][x] = string.char(math.floor(v * 255))
      end
    end

    local writer = assert(png.writer())
    local out = assert(io.open(filename, "wb"))
    assert(writer:set_write_fn(function (data)
      out:write(data)
    end))
    assert(writer:set_IHDR {
      width = width;
      height = height;
      bit_depth = 8;
      color_type = png.PNG_COLOR_TYPE_GRAY;
    })
    for y = 1, height do
      assert(writer:set_row(y, table.concat(rows[y])))
    end
    assert(writer:write_png())

    out:close()
  end
else
  io.stderr:write "could not require dromozoa.png\n"
  write_png = function () end
end

return function (results, dir)
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

  local dataset = {}

  local version = results.version
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
    write_png(("%s/%04d.png"):format(dir, i), samples, {
      min = min(samples, 1, #samples);
      max = max(samples, 1, #samples);
    })

    local n = #samples
    local m = n * 0.25
    m = m - m % 1

    n = n - m
    m = m + 1

    local data = {
      version = version;
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
    out:write(("%s\t%s\t%.17g\t%.17g\t%.17g\t%.17g\t%.17g\n"):format(data.version, data.name, data.avg, data.min, data.max, data.sd / data.avg, data.sd))
  end
  out:close()

  return dataset
end
