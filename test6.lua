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
local data2 = {}

local chars = { "09", "AZ", "az", "\128\255" }

for i = 1, #chars do
  for j = 1, #chars do
    for k = 1, #chars do
      local x = chars[i]
      local y = chars[j]
      local z = chars[k]
      local item = {}
      local i, j = x:byte(1, 2)
      for i = i, j do
        item[#item + 1] = i
      end
      if y ~= x then
        local i, j = y:byte(1, 2)
        for i = i, j do
          item[#item + 1] = i
        end
      end
      if z ~= y and z ~= x then
        local i, j = z:byte(1, 2)
        for i = i, j do
          item[#item + 1] = i
        end
      end
      data1[#data1 + 1] = item

      local set = {}
      -- for i = 0, 257 do
      --   set[i] = false
      -- end
      for i = 1, #item do
        set[item[1]] = true
      end
      data2[#data2 + 1] = set
    end
  end
end

if false then
  collectgarbage()
  collectgarbage()
  local c1 = collectgarbage("count")

  data1 = nil

  collectgarbage()
  collectgarbage()
  local c2 = collectgarbage("count")

  data2 = nil

  collectgarbage()
  collectgarbage()
  local c3 = collectgarbage("count")

  print("data1", c1 - c2)
  print("data2", c2 - c3)
end

local sort = table.sort

return {
  copy_sort = { function ()
    local data = {}
    for i = 1, #data1 do
      local item = data1[i]
      local t = {}
      for j = 1, #item do
        t[j] = item[j]
      end
      sort(t)
      data[i] = t
    end
    return data
  end };
  set_ = { function ()
    local data = {}
    for i = 1, #data2 do
      local set = data2[i]
      local t = {}
      for j = 0, 257 do
        if t[j] then
          t[#t + 1] = j
        end
      end
      data[i] = t
    end
    return data
  end };
}
