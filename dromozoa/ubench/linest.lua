-- Copyright (C) 2015,2017 Tomoyuki Fujimori <moyu@dromozoa.com>
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

local empty = require "dromozoa.commons.empty"

local function linest_y(Y)
  local sum_x = 0
  local sum_y = 0
  local sum_xx = 0
  local sum_xy = 0
  local n = #Y
  for x = 1, n do
    local y = Y[x]
    sum_x = sum_x + x
    sum_y = sum_y + y
    sum_xx = sum_xx + x * x
    sum_xy = sum_xy + x * y
  end
  local d = n * sum_xx - sum_x * sum_x
  return (n * sum_xy - sum_x * sum_y) / d, (sum_y * sum_xx - sum_x * sum_xy) / d
end

local function linest_yx(Y, X)
  local sum_x = 0
  local sum_y = 0
  local sum_xx = 0
  local sum_xy = 0
  local n = #Y
  for i = 1, n do
    local x = X[i]
    local y = Y[i]
    sum_x = sum_x + x
    sum_y = sum_y + y
    sum_xx = sum_xx + x * x
    sum_xy = sum_xy + x * y
  end
  local d = n * sum_xx - sum_x * sum_x
  return (n * sum_xy - sum_x * sum_y) / d, (sum_y * sum_xx - sum_x * sum_xy) / d
end

local function linest_yb(Y, b)
  local sum_x = 0
  local sum_xx = 0
  local sum_xy = 0
  for x = 1, #Y do
    local y = Y[x]
    sum_x = sum_x + x
    sum_xx = sum_xx + x * x
    sum_xy = sum_xy + x * y
  end
  return (sum_xy - b * sum_x) / sum_xx, b
end

local function linest_yxb(Y, X, b)
  local sum_x = 0
  local sum_xx = 0
  local sum_xy = 0
  for i = 1, #Y do
    local x = X[i]
    local y = Y[i]
    sum_x = sum_x + x
    sum_xx = sum_xx + x * x
    sum_xy = sum_xy + x * y
  end
  return (sum_xy - b * sum_x) / sum_xx, b
end

return function (Y, X, b)
  if b == nil then
    if X == nil or empty(X) then
      return linest_y(Y)
    else
      return linest_yx(Y, X)
    end
  else
    if X == nil or empty(X) then
      return linest_yb(Y, b)
    else
      return linest_yxb(Y, X, b)
    end
  end
end
