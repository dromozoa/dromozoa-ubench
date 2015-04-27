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

local function average(V, i, j)
  local n = j - i + 1
  local u = 0
  while i <= j do
    local v = V[i]
    u = u + v
    i = i + 1
  end
  return u / n
end

local function stdev(V, i, j, n)
  local a = average(V, i, j)
  local u = 0
  while i <= j do
    local v = V[i] - a
    u = u + v * v
    i = i + 1
  end
  return (u / n) ^ 0.5, a
end

return {
  -- population
  p = function (V, i, j)
    if not i then i = 1 end
    if not j then j = #V end
    return stdev(V, i, j, j - i + 1)
  end;
  -- sample
  s = function (V, i, j)
    if not i then i = 1 end
    if not j then j = #V end
    return stdev(V, i, j, j - i)
  end;
}
