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

local run1 = require "dromozoa.ubench.run1"
local stdev = require "dromozoa.ubench.stdev"

return function (m, n, fn)
  local data = {}
  for i = 1, m do
    data[i] = run1(n, fn) / n
  end
  table.sort(data)
  local a = m / 8
  local b = a * 3
  a = a - a % 1
  b = b - b % 1
  return stdev.s(data, a, b)
end
