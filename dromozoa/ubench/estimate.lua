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

return function (u, fn)
  local a = u * 0.99
  local b = u * 1.01
  local n = 1
  while true do
    local t = run1(n, fn)
    if a <= t and t < b then
      return n
    end
    if t < 1 then
      t = 1
    end
    local m = n * u / t
    m = m - m % 1
    if m < 1 then
      m = 1
    end
    if n == m then
      return n
    end
    n = m
  end
end
