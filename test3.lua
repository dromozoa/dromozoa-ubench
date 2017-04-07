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
local ubench = require "dromozoa.ubench"

local function fibonacci(n)
  if n < 2 then
    return n
  else
    return fibonacci(n - 2) + fibonacci(n - 1)
  end
end

local function tarai(x, y, z)
  if x <= y then
    return y
  else
    return tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y))
  end
end

local context = ubench.initialize()

local b = ubench()
-- b:add("fib2", function (_, n) fibonacci(n) end, nil, 2)
-- b:add("fib3", function (_, n) fibonacci(n) end, nil, 3)
-- b:add("fib4", function (_, n) fibonacci(n) end, nil, 4)
-- b:add("fib5", function (_, n) fibonacci(n) end, nil, 5)
-- b:add("fib6", function (_, n) fibonacci(n) end, nil, 6)
-- b:add("fib7", function (_, n) fibonacci(n) end, nil, 7)
-- b:add("fib8", function (_, n) fibonacci(n) end, nil, 8)
b:add("fib9", function (_, n) fibonacci(n) end, nil, 9)
local r = b:run()

context:terminate()

print(json.encode(r, { pretty = true }))
