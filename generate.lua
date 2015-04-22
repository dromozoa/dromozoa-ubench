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

local format = string.format

local DEBUG = false

local function write(out, name, n, fn)
  out:write(format("tbl[%q] = function()\n", format("%s%d", name, n)))
  out:write [[
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
]]
  for i = 1, n do
    fn(out, i)
    out:write("\n")
  end
  if DEBUG then
    out:write "print(out)\n"
  end
  out:write "end\n"
  out:write [[
]]
  if DEBUG then
    out:write(format("tbl[%q]()\n", format("%s%d", name, n)))
  end
end

local tbl = {
  { "MOVE", function (out, i) out:write("out = n1") end };
  { "ADD", function (out, i) out:write("out = n1 + n2") end };
  { "SUB", function (out, i) out:write("out = n1 - n2") end };
  { "MUL", function (out, i) out:write("out = n1 * n2") end };
  { "MOD", function (out, i) out:write("out = n1 % n2") end };
  { "POW", function (out, i) out:write("out = n1 ^ n2") end };
  { "DIV", function (out, i) out:write("out = n1 / n2") end };
  { "IDIV", function (out, i) out:write("out = n1 // n2") end };
  { "BAND", function (out, i) out:write("out = n1 & n2") end };
  { "BOR", function (out, i) out:write("out = n1 | n2") end };
  { "BXOR", function (out, i) out:write("out = n1 ~ n2") end };
  { "SHL", function (out, i) out:write("out = n1 << n2") end };
  { "SHR", function (out, i) out:write("out = n1 >> n2") end };
  { "UNM", function (out, i) out:write("out = -n1") end };
  { "BNOT", function (out, i) out:write("out = ~n1") end };
  { "NOT", function (out, i) out:write("out = not b0") end };
  { "LEN", function (out, i) out:write("out = #s1") end };
  { "CONCAT", function (out, i) out:write("out = s1 .. s2") end }; -- MOVE,MOVE
  { "EQ", function (out, i) out:write("if n1 == n1 then out = n1 + n2 end") end }; -- ADD
  { "LT", function (out, i) out:write("if n1 < n2 then out = n1 + n2 end") end }; -- ADD
  { "LE", function (out, i) out:write("if n1 <= n2 then out = n1 + n2 end") end }; -- ADD
  { "TEST", function (out, i) out:write("if b1 then out = n1 + n2 end") end }; -- ADD
  { "TESTSET", function (out, i) out:write("out = b1 or n1") end };
}

io.write("local tbl = {}\n")
for i = 1, #tbl do
  local v = tbl[i]
  local name = v[1]
  local fn = v[2]
  if DEBUG then
    write(io.stdout, name, 4, fn)
  else
    for j = 4, 16, 4 do
      write(io.stdout, name, j, fn)
    end
  end
end
io.write("return tbl\n")
