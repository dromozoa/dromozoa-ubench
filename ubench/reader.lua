#! /usr/bin/env lua

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

b:add("byte1", function (ctx, text)
  local n = #text
  for i = 1, n do
    local a = text:byte(i)
    local v = ctx[a]
    if v then
      ctx[a] = v + 1
    else
      ctx[a] = 1
    end
  end
end, {}, text)

local context = ubench.initialize()
local results = b:run()
context:terminate()
io.write(json.encode(results, { pretty = true }), "\n")
