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

local X = 16
local Y = 16
local Z = 16

local function create1_arithmetic()
  local t = {}
  for x = 1, 113, 7 do
    for y = 1, 113, 7 do
      for z = 1, 113, 7 do
        local k = (x * 65535 + y) * 65535 + z
        t[k] = x + y + z
      end
    end
  end
  return t
end

local function create1_concat()
  local t = {}
  for x = 1, 113, 7 do
    for y = 1, 113, 7 do
      for z = 1, 113, 7 do
        local k = x .. "," .. y .. "," .. z
        t[k] = x + y + z
      end
    end
  end
  return t
end

local function create1_array()
  local t = {}
  local n = 0
  for x = 1, 113, 7 do
    for y = 1, 113, 7 do
      for z = 1, 113, 7 do
        n = n + 4
        t[n - 3] = x
        t[n - 2] = y
        t[n - 1] = z
        t[n] = x + y + z
      end
    end
  end
  return t
end

local function create2()
  local t = {}
  local n = 0
  for x = 1, 113, 7 do
    for y = 1, 113, 7 do
      for z = 1, 113, 7 do
        n = n + 1
        t[n] = { x, y, z, x + y + z }
      end
    end
  end
  return t
end

local function compare(a, b)
  local az = a[3]
  local bz = b[3]
  if az == bz then
    local ay = a[2]
    local by = b[2]
    if ay == by then
      return a[1] < b[1]
    else
      return ay < by
    end
  else
    return az < bz
  end
end

local table_sort = table.sort

local function create2_sort()
  local t = {}
  local n = 0
  for x = 1, 113, 7 do
    for y = 1, 113, 7 do
      for z = 1, 113, 7 do
        n = n + 1
        t[n] = { x, y, z, x + y + z }
      end
    end
  end
  table_sort(t, compare)
  return t
end

local function create4()
  local t1 = {}
  local t2 = {}
  local t3 = {}
  local t4 = {}
  local n = 0
  for x = 1, 113, 7 do
    for y = 1, 113, 7 do
      for z = 1, 113, 7 do
        n = n + 1
        t1[n] = x
        t2[n] = y
        t3[n] = z
        t4[n] = x + y + z
      end
    end
  end
  return t1, t2, t3, t4
end

local function create3_multi()
  local t = {}
  for x = 1, 113, 7 do
    t[x] = {}
    for y = 1, 113, 7 do
      t[x][y] = {}
      for z = 1, 113, 7 do
        t[x][y][z] = x + y + z
      end
    end
  end
  return t
end

local function create4_table()
  local t1 = {}
  local t2 = {}
  local t3 = {}
  local n1 = 0
  local n2 = 0
  local n3 = 0
  local t = {}
  for x = 1, 113, 7 do
    for y = 1, 113, 7 do
      for z = 1, 113, 7 do
        local k1 = t1[x]
        if k1 == nil then
          n1 = n1 + 1
          k1 = n1
          t1[x] = k1
        end
        local k2 = t2[y]
        if k2 == nil then
          n2 = n2 + 1
          k2 = n2
          t2[y] = k2
        end
        local k3 = t3[z]
        if k3 == nil then
          n3 = n3 + 1
          k3 = n3
          t3[z] = k3
        end
        local k = (k1 * 65535 + k2) * 65535 + k3
        t[k] = x + y + z
      end
    end
  end
  return t
end

local function size(name, f)
  collectgarbage()
  collectgarbage()
  local c1 = collectgarbage("count")
  local t = f()
  collectgarbage()
  collectgarbage()
  local c2 = collectgarbage("count")
  print(name, c2 - c1, t)
end

if true then
  size("create1_ari", create1_arithmetic)
  size("create1_cat", create1_concat)
  size("create3_mul", create3_multi)
end

return {
  create1_ari = { create1_arithmetic };
  create1_cat = { create1_concat };
  create1_arr = { create1_array };
  create2_arr = { create2 };
  -- create2_sor = { create2_sort };
  create3_mul = { create3_multi };
  create4_arr = { create4 };
  create4_tbl = { create4_table };
}
