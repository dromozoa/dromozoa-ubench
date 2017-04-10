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

local json = require "dromozoa.commons.json"
local read_file = require "dromozoa.commons.read_file"
local ubench = require "dromozoa.ubench"

local filename, T, N = ...
local text = assert(read_file(filename))

local b = ubench()
T = tonumber(T)
N = tonumber(N)
if T ~= nil then
  b.T = T
end
if N ~= nil then
  b.N = N
end

local function new_counter()
  local counter = {}
  for i = 0, 255 do
    counter[i] = 0
  end
  return counter
end

b:add("byte1", function (counter, text)
  local n = #text
  for i = 1, n do
    local a = text:byte(i)
    counter[a] = counter[a] + 1
  end
  return counter
end, new_counter(), text)

b:add("byte2", function (counter, text)
  local n = #text
  local m = n % 2
  for i = 1, n - 1, 2 do
    local a, b = text:byte(i, i + 1)
    counter[a] = counter[a] + 1
    counter[b] = counter[b] + 1
  end
  if m == 1 then
    local a = text:byte(n)
    counter[a] = counter[a] + 1
  end
  return counter
end, new_counter(), text)

b:add("byte4", function (counter, text)
  local n = #text
  local m = n % 4
  for i = 1, n - 3, 4 do
    local a, b, c, d = text:byte(i, i + 3)
    counter[a] = counter[a] + 1
    counter[b] = counter[b] + 1
    counter[c] = counter[c] + 1
    counter[d] = counter[d] + 1
  end
  if m > 0 then
    for i = n - (m - 1), n do
      local a = text:byte(i)
      counter[a] = counter[a] + 1
    end
  end
  return counter
end, new_counter(), text)

b:add("byte8", function (counter, text)
  local n = #text
  local m = n % 8
  for i = 1, n - 7, 8 do
    local c1, c2, c3, c4, c5, c6, c7, c8 = text:byte(i, i + 7)
    counter[c1] = counter[c1] + 1
    counter[c2] = counter[c2] + 1
    counter[c3] = counter[c3] + 1
    counter[c4] = counter[c4] + 1
    counter[c5] = counter[c5] + 1
    counter[c6] = counter[c6] + 1
    counter[c7] = counter[c7] + 1
    counter[c8] = counter[c8] + 1
  end
  if m > 0 then
    for i = n - (m - 1), n do
      local c = text:byte(i)
      counter[c] = counter[c] + 1
    end
  end
  return counter
end, new_counter(), text)

b:add("byte8x", function (counter, text)
  local byte = string.byte
  local n = #text
  local m = n % 8
  for i = 1, n - 7, 8 do
    local c1, c2, c3, c4, c5, c6, c7, c8 = byte(text, i, i + 7)
    counter[c1] = counter[c1] + 1
    counter[c2] = counter[c2] + 1
    counter[c3] = counter[c3] + 1
    counter[c4] = counter[c4] + 1
    counter[c5] = counter[c5] + 1
    counter[c6] = counter[c6] + 1
    counter[c7] = counter[c7] + 1
    counter[c8] = counter[c8] + 1
  end
  if m > 0 then
    for i = n - (m - 1), n do
      local c = text:byte(i)
      counter[c] = counter[c] + 1
    end
  end
  return counter
end, new_counter(), text)

b:add("byte16", function (counter, text)
  local n = #text
  local m = n % 16
  for i = 1, n - 15, 16 do
    local c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16 = text:byte(i, i + 15)
    counter[c1] = counter[c1] + 1
    counter[c2] = counter[c2] + 1
    counter[c3] = counter[c3] + 1
    counter[c4] = counter[c4] + 1
    counter[c5] = counter[c5] + 1
    counter[c6] = counter[c6] + 1
    counter[c7] = counter[c7] + 1
    counter[c8] = counter[c8] + 1
    counter[c9] = counter[c9] + 1
    counter[c10] = counter[c10] + 1
    counter[c11] = counter[c11] + 1
    counter[c12] = counter[c12] + 1
    counter[c13] = counter[c13] + 1
    counter[c14] = counter[c14] + 1
    counter[c15] = counter[c15] + 1
    counter[c16] = counter[c16] + 1
  end
  if m > 0 then
    for i = n - (m - 1), n do
      local c = text:byte(i)
      counter[c] = counter[c] + 1
    end
  end
  return counter
end, new_counter(), text)


local context = ubench.initialize()
local results = b:run()
context:terminate()
io.write(json.encode(results, { pretty = true }), "\n")
