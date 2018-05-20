-- Copyright (C) 2018 Tomoyuki Fujimori <moyu@dromozoa.com>
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

local ubench = require "dromozoa.ubench"

local linest = ubench.linest
local max = ubench.max
local min = ubench.min
local stdev = ubench.stdev

local function assert_number(actual, expected)
  local epsilon = 0.000001
  assert(expected - epsilon < actual)
  assert(actual < expected + epsilon)
end

local Y = { 0.01, 0.97, 2.02, 2.99, 4.03 }
local X = { 0, 2, 4, 6, 8 }

local a, b = linest(Y, X)
assert_number(a, 0.503)
assert_number(b, -0.008)

local a, b = linest(Y)
assert_number(a, 1.006)
assert_number(b, -1.014)

local a, b = linest(Y, X, 0)
assert_number(a, 0.50166667)
assert_number(b, 0)

local a, b = linest(Y, nil, 0)
assert_number(a, 0.72945455)
assert_number(b, 0)

local V = { 0.85, 0.9, 1, 1.1, 1.15 }

assert_number(max(V, 1, #V), 1.15)
assert_number(min(V, 1, #V), 0.85)

local s, a = stdev(V, 1, #V)
assert_number(s, 0.12747579)
assert_number(a, 1)

local s, a = stdev.s(V, 1, #V)
assert_number(s, 0.12747579)
assert_number(a, 1)

local s, a = stdev.p(V, 1, #V)
assert_number(s, 0.11401754)
assert_number(a, 1)
