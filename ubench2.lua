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

local estimate = require "dromozoa.ubench.estimate"
local run1 = require "dromozoa.ubench.run1"
local run2 = require "dromozoa.ubench.run2"
local tarai = require "dromozoa.ubench.tarai"

local bench = {}

function bench.empty()
end

function bench.loadk()
  local a = 1
end

function bench.inc1()
  local a = 1
  a = a + 1
end

function bench.inc2()
  local a = 1
  a = a + 1
  a = a + 1
end

function bench.inc3()
  local a = 1
  a = a + 1
  a = a + 1
  a = a + 1
end

function bench.tarai2()
  tarai(2, 1, 0)
end

function bench.tarai4()
  tarai(4, 2, 0)
end

function bench.tarai6()
  tarai(6, 3, 0)
end

local data = {}
for k, v in pairs(bench) do
  data[k] = {
    n = estimate(1000, v);
    r = {};
  }
end

for i = 1, 800 do
  for k, v in pairs(bench) do
    local n = data[k].n
    local r = run1(n, v)
    data[k].r[i] = r / n
  end
end

for k, v in pairs(data) do
  local out = assert(io.open(string.format("tmp-%s.txt", k), "w"))
  for i = 1, #data[k].r do
    out:write(data[k].r[i], "\n")
  end
  out:close()
end
