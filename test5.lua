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

local dumper = require "dromozoa.commons.dumper"

local data1 = {}

local concat = table.concat
local sort = table.sort
local unpack = table.unpack or unpack
local char = string.char
local utf8_char = utf8 and utf8.char
local format = string.format

local formats = {}
formats[6] = "%d,%d,%d,%d,%d,%d"

for a = 1, 16 do
  for b = 16, 1, -1 do
    if a ~= b then
      for c = 1, 16 do
        if a ~= b and b ~= c then
          -- local t = { a, b, c, 17, 23, 29, a + 37, b + 41, c + 13 }
          -- local t = { a, b, c, a + 37, b + 41, c + 13 }
          local t = { a, b, c }
          sort(t)
          t[4] = t[1] + 23
          t[5] = t[2] + 37
          t[6] = t[3] + 41
          data1[#data1 + 1] = t
        end
      end
    end
  end
end

local bench = {
  data1_arithm = { function ()
    local t = {}
    local n = 0
    local c = 0
    for i = 1, #data1 do
      local item = data1[i]
      local key = 0
      for j = 1, #item do
        key = key * 255 + item[j]
      end
      if t[key] then
        c = c + 1
      else
        n = n + 1
        t[key] = n
      end
    end
    return t, n, c
  end };
  data1_concat = { function ()
    local t = {}
    local n = 0
    local c = 0
    for i = 1, #data1 do
      local item = data1[i]
      local key = concat(item, ",")
      if t[key] then
        c = c + 1
      else
        n = n + 1
        t[key] = n
      end
    end
    return t, n, c
  end };
  data1_char__ = { function ()
    local t = {}
    local n = 0
    local c = 0
    for i = 1, #data1 do
      local item = data1[i]
      local key = char(unpack(item))
      if t[key] then
        c = c + 1
      else
        n = n + 1
        t[key] = n
      end
    end
    return t, n, c
  end };
  data1_format = { function ()
    local t = {}
    local n = 0
    local c = 0
    for i = 1, #data1 do
      local item = data1[i]
      local key = format(formats[#item], unpack(item))
      if t[key] then
        c = c + 1
      else
        n = n + 1
        t[key] = n
      end
    end
    return t, n, c
  end };
  data1_flat__ = { function ()
    local t = {}
    local n = 0
    local c = 0
    for i = 1, #data1 do
      local item = data1[i]
      local x = t
      local m = #item
      for j = 1, m - 1 do
        local v = item[j]
        local y = x[v]
        if y == nil then
          y = {}
          x[v] = y
        end
        x = y
      end
      local v = item[m]
      if x[v] then
        c = c + 1
      else
        n = n + 1
        x[v] = n
      end
    end
    return t, n, c
  end };
}

if utf8_char then
  bench.data1_u8char = { function ()
    local t = {}
    local n = 0
    local c = 0
    for i = 1, #data1 do
      local item = data1[i]
      local key = utf8_char(unpack(item))
      if t[key] then
        c = c + 1
      else
        n = n + 1
        t[key] = n
      end
    end
    return t, n, c
  end };
end

local function size(name, f)
  collectgarbage()
  collectgarbage()
  local c1 = collectgarbage("count")
  local t, n, c = f()
  collectgarbage()
  collectgarbage()
  local c2 = collectgarbage("count")
  print(name, c2 - c1, n, c)
  -- print(dumper.encode(t))
end

-- bench.data1_flat__[1]()

-- for name, b in pairs(bench) do
--   size(name, b[1])
-- end

return bench
