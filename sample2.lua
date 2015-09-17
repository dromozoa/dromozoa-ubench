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

local loadstring = loadstring or load

local B = {}

for i = 0, 16 do
  local code = {}
  code[#code + 1] = [[
return function ()
  local data = { 1, 2 }
]]
  for j = 1, i do
    code[#code + 1] = "  data[3] = data[1] + data[2]\n"
  end
  code[#code + 1] = "end\n"
  B[#B + 1] = { "TABLE-NUMBER/" .. i, assert(loadstring(table.concat(code)))() }
end

for i = 0, 16 do
  local code = {}
  code[#code + 1] = [[
return function ()
  local data = { a = 1, b = 2 }
]]
  for j = 1, i do
    code[#code + 1] = "  data.c = data.a + data.b\n"
  end
  code[#code + 1] = "end\n"
  B[#B + 1] = { "TABLE-STRING/" .. i, assert(loadstring(table.concat(code)))() }
end

return B
