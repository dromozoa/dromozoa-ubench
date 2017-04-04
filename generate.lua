#! /usr/bin/env lua

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

local version
local debug
for i = 1, #arg do
  local v = arg[i]
  if v:match("^%d+%.%d+$") then
    version = v
  elseif v:lower() == "debug" then
    debug = true
  end
end

if not version then
  version = _VERSION
end
local major_version, minor_version = version:match("(%d+)%.(%d+)")
major_version = assert(tonumber(major_version))
minor_version = assert(tonumber(minor_version))
local version_number = major_version * 16 + minor_version

local function write(out, name, n, code, opts)
  local key = format("%s/%d", name, n)
  out:write(format([[
B[#B + 1] = { %q, function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local f0, fc, ft = call0, call, tailcall
]], key))
  for i = 1, n do
    out:write(code, "\n")
  end
  if debug then
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
  if debug then
    out:write("B[#B][2]()\n")
  end
end

local def = {
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
  { "IDIV",     "out = n1 // n2" };
  { "BAND",     "out = n1 & n2" };
  { "BOR",      "out = n1 | n2" };
  { "BXOR",     "out = n1 ~ n2" };
  { "SHL",      "out = n1 << n2" };
  { "SHR",      "out = n1 >> n2" };
  { "UNM",      "out = -n1" };
  { "BNOT",     "out = ~n1" };
  { "NOT",      "out = not b0" };
  { "LEN",      "out = #s1" };
  { "CONCAT",   "out = s1 .. s2", { MOVE = 2 } };
  { "EQ",       "if n1 == n1 then out = n1 + n2 end", { ADD = 1 } };
  { "LT",       "if n1 < n2 then out = n1 + n2 end",  { ADD = 1 } };
  { "LE",       "if n1 <= n2 then out = n1 + n2 end", { ADD = 1 } };
  { "TEST",     "if b1 then out = n1 + n2 end",       { ADD = 1 } };
  { "TESTSET",  "out = b1 or n1" };
  { "CALL0",    "out = f0(n1, n2)", { MOVE = 5, GETUPVAL = 1, ADD = 1 } };
  { "CALL",     "out = fc(n1, n2)", { CALL0 = 1 } };
  { "TAILCALL", "out = ft(n1, n2)", { CALL0 = 1 } };
  { "CLOSURE",  "out = function () end", { MOVE = 1 } };
  { "VARARG",   "out = ..." };
}

local lua53_def = {
  IDIV = true;
  BAND = true;
  BOR  = true;
  BXOR = true;
  SHL  = true;
  SHR  = true;
  BNOT = true;
}

io.write [[
local function add(a, b)
  return a + b
end

local function call0(a, b)
  local out, a, b = add, a, b
  out = a + b
  return out
end

local function call(a, b)
  local out = add(a, b)
  return out
end

local function tailcall(a, b)
  return add(a, b)
end

local un = 1, 2
local ut = { 1, 2, 3, 4, 5, 6, 7, 8 }
local B = {}
]]
for i = 1, #def do
  local v = def[i]
  local name = v[1]
  local code = v[2]
  local opts = v[3] or {}

  if version_number >= 83 or not lua53_def[name] then
    if debug then
      write(io.stdout, name, 4, code, opts)
    else
      for j = 8, 32, 2 do
        write(io.stdout, name, j, code, opts)
      end
    end
  end
end
io.write [[
return B
]]