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

local average = require "dromozoa.ubench.average"

local function stdev(data, i, j, n)
  local a = average(data, i, j)
  local u = 0
  while i <= j do
    local v = data[i] - a
    u = u + v * v
    i = i + 1
  end
  return (u / n) ^ 0.5, a
end

return {
  -- population
  p = function (data, i, j)
    if not i then i = 1 end
    if not j then j = #data end
    return stdev(data, i, j, j - i + 1)
  end;
  -- sample
  s = function (data, i, j)
    if not i then i = 1 end
    if not j then j = #data end
    return stdev(data, i, j, j - i)
  end;
}
