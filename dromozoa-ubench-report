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

local linest = require "dromozoa.ubench.linest"

local format = string.format

local B = assert(loadfile(arg[1]))()
local K = {}
local N = {}
local X = {}
local C = {}
for i = 1, #B do
  local key = B[i][1]
  K[key] = i
  local name, n = key:match("^(.*)/(%d+)$")
  assert(name)
  n = tonumber(n)
  local x = X[name]
  if x then
    x[#x + 1] = n
  else
    N[#N + 1] = name
    X[name] = { n }
  end
  if not C[name] then
    C[name] = B[i][3] or {}
  end
end

local range_a, range_b = arg[2]:match("^(%d+):(%d+)$")
range_a = tonumber(range_a)
range_b = tonumber(range_b)

local A = {}
for i = 3, #arg do
  local R = assert(loadfile(arg[i]))()
  for j = 1, #R do
    local a = A[j]
    local r = R[j][2]
    if not a or a > r then
      A[j] = r
    end
  end
end

local Y = {}
for i = 1, #N do
  local name = N[i]
  local x = X[name]
  local y = {}
  for j = 1, #x do
    local n = x[j]
    local k = K[format("%s/%d", name, n)]
    y[#y + 1] = A[k]
  end
  Y[name] = y
end

local A = {}
local B = {}
for i = 1, #N do
  local name = N[i]
  local y
  local x
  if range_a and range_b then
    y = {}
    x = {}
    for i = 1, #X[name] do
      local v = X[name][i]
      if range_a <= v and v <= range_b then
        y[#y + 1] = Y[name][i]
        x[#x + 1] = v
      end
    end
  else
    y = Y[name]
    x = X[name]
  end
  A[name], B[name] = linest(y, x)
end

io.write("Name")
local x = X[N[1]]
for i = 1, #x do
  io.write(format("\t%d", x[i]))
end
io.write("\tA\tB\n")

for i = 1, #N do
  local name = N[i]
  io.write(name)
  local y = Y[name]
  for j = 1, #y do
    io.write(format("\t%.17g", y[j]))
  end
  io.write(format("\t%.17g\t%.17g\n", A[name], B[name]))
end
