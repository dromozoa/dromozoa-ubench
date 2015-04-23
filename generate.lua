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

local VERSION, DEBUG = ...
VERSION = tonumber(VERSION)

local function write(out, name, n, code, opts)
  local key = format("%s/%d", name, n)
  out:write(format([[
ubench[#ubench + 1] = { %q, function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
]], key))
  for i = 1, n do
    out:write(code, "\n")
  end
  if DEBUG then
    out:write "print(out)\n"
  end
  out:write [[
end, {
]]
  for k, v in pairs(opts) do
    out:write(format("[%q] = %d;\n", k, v))
  end
  out:write [[
} }
]]
  if DEBUG then
    out:write("ubench[#ubench][2]()\n")
  end
end

local tbl = {
  { "NOOP",     "" };
  { "MOVE",     "out = n1" };
  { "LOADK",    "out = 42" };
  { "LOADBOOL", "out = true" };
  { "GETUPVAL", "out = un" };
  { "GETTABUP", "out = ut[n1]" };
  { "GETTABLE", "out = t[n1]" };
  { "SETUPVAL", "un = n1" };
  { "SETTABUP", "ut[n1] = n1" };
  { "SETTABLE", "t[n1] = n1" };
  { "NEWTABLE", "out = {}", { MOVE = 1 } };
  { "ADD",      "out = n1 + n2" };
  { "SUB",      "out = n1 - n2" };
  { "MUL",      "out = n1 * n2" };
  { "MOD",      "out = n1 % n2" };
  { "POW",      "out = n1 ^ n2" };
  { "DIV",      "out = n1 / n2" };
  { "IDIV",     "out = n1 // n2", {}, 83 };
  { "BAND",     "out = n1 & n2",  {}, 83 };
  { "BOR",      "out = n1 | n2",  {}, 83 };
  { "BXOR",     "out = n1 ~ n2",  {}, 83 };
  { "SHL",      "out = n1 << n2", {}, 83 };
  { "SHR",      "out = n1 >> n2", {}, 83 };
  { "UNM",      "out = -n1" };
  { "BNOT",     "out = ~n1", {}, 83 };
  { "NOT",      "out = not b0" };
  { "LEN",      "out = #s1" };
  { "CONCAT",   "out = s1 .. s2", { MOVE = 2 } };
  { "EQ",       "if n1 == n1 then out = n1 + n2 end", { ADD = 1 } };
  { "LT",       "if n1 < n2 then out = n1 + n2 end",  { ADD = 1 } };
  { "LE",       "if n1 <= n2 then out = n1 + n2 end", { ADD = 1 } };
  { "TEST",     "if b1 then out = n1 + n2 end",       { ADD = 1 } };
  { "TESTSET",  "out = b1 or n1" };
  { "CALL_C",   "out = fc(n1, n2)", { CALL_I = 1 } };
  { "CALL_T",   "out = ft(n1, n2)", { CALL_I = 1 } };
  { "CALL_I",   "out = fi(n1, n2)", { MOVE = 5, GETUPVAL = 1, ADD } };
  { "CLOSURE",  "out = function () end", { MOVE = 1 } };
  { "VARARG",   "out = ..." };
}

io.write [[
local function add(a, b)
  return a + b
end

-- GETUPVAL
-- MOVE
-- MOVE
-- CALL
--   ADD
--   RETURN
-- RETURN
local function call(a, b)
  local out = add(a, b)
  return out
end

-- GETUPVAL
-- MOVE
-- MOVE
-- TAILCALL
--   ADD
--   RETURN
-- RETURN
local function tailcall(a, b)
  return add(a, b)
end

-- GETUPVAL
-- MOVE
-- MOVE
-- ADD
-- RETURN
local function inline(a, b)
  local out, a, b = add, a, b
  out = a + b
  return out
end

local un = 1, 2
local ut = { 1, 2, 3, 4, 5, 6, 7, 8 }
local ubench = {}
]]
for i = 1, #tbl do
  local v = tbl[i]
  local name = v[1]
  local code = v[2]
  local opts = v[3]
  local version = v[4]
  if not opts then
    opts = {}
  end
  if not version then
    version = 51
  end
  if version <= VERSION then
    if DEBUG then
      write(io.stdout, name, 4, code, opts)
    else
      for j = 4, 32, 4 do
        write(io.stdout, name, j, code, opts)
      end
    end
  end
end
io.write [[
return ubench
]]
