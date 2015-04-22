-- Copyright (C) 2015 Tomoyuki Fujimori <moyu@dromozoa.com>
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

local json = require "dromozoa.json"

local names = {}
local name_set = {}

local data = json.decode(io.stdin:read("*a"))

local result = {}
for i = 1, #data do
  local v = data[i]
  local k = v[1]
  local s = v[2]
  local a = v[3]
  local name, n = k:match("^(.*)/(%d+)$")
  assert(name)
  if not name_set[name] then
    names[#names + 1] = name
    name_set[name] = true
  end
  local n = tonumber(n)
  local t = result[name]
  if not t then
    t = {}
    result[name] = t
  end
  t[n] = a
end

for i = 1, #names do
  local name = names[i]
  local v = result[name]
  io.write(name)
  for j = 4, 32, 4 do
    -- io.write(json.encode(v))
    io.write(string.format("\t%.17g", v[j]))
  end
  io.write("\n")
end

