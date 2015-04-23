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

local function linest1k(y, x, b)
  local sx = 0
  local sxx = 0
  local sxy = 0

  local n = #y
  for i = 1, n do
    local vx = x[i] or i
    local vy = y[i]
    sx = sx + vx
    sxx = sxx + vx * vx
    sxy = sxy + vx * vy
  end

  local a = (sxy - b * sx) / sxx
  return a, b
end

local function linest1(y, x)
  local sx = 0
  local sy = 0
  local sxx = 0
  local sxy = 0

  local n = #y
  for i = 1, n do
    local vx = x[i] or i
    local vy = y[i]
    sx = sx + vx
    sy = sy + vy
    sxx = sxx + vx * vx
    sxy = sxy + vx * vy
  end

  local d = n * sxx - sx * sx
  local a = (n * sxy - sx * sy) / d
  local b = (sy * sxx - sx * sxy) / d
  return a, b
end

return function (y, x, b)
  if b then
    return linest1k(y, x, b)
  else
    return linest1(y, x)
  end
end
