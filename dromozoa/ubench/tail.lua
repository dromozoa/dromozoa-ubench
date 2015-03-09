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

local function tail1(ctx, i, j, v, ...)
  if i == j then
    return ctx + v
  else
    return tail1(ctx + v, i + 1, j, ...)
  end
end

local function tail2(ctx, i, j, v, ...)
  if j > 1 then
    return tail2(ctx + v, i + 1, j - 1, ...)
  else
    return ctx + v
  end
end

return function (b)
  local unpack = table.unpack or unpack

  local data = {}
  for i = 1, 16 do
    data[i] = i
  end

  b:add("for", function (ctx, ...)
    for i = 1, select("#", ...) do
      ctx = ctx + select(i, ...)
    end
    return ctx
  end, 0, unpack(data))

  b:add("tail1", function (ctx, ...)
    return tail1(ctx, 1, select("#", ...), ...)
  end, 0, unpack(data))

  b:add("tail2", function (ctx, ...)
    return tail2(ctx, 1, select("#", ...), ...)
  end, 0, unpack(data))
end
