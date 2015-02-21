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

local metatable = {}

function metatable.__add(a, b)
  local s = a.tv_sec + b.tv_sec
  local u = a.tv_usec + b.tv_usec
  if u >= 1000000 then
    s = s + 1
    u = u - 1000000
  end
  return setmetatable({ tv_sec = s; tv_usec = u }, metatable)
end

function metatable.__sub(a, b)
  local s = a.tv_sec - b.tv_sec
  local u = a.tv_usec - b.tv_usec
  if u < 0 then
    s = s - 1
    u = u + 1000000
  end
  return setmetatable({ tv_sec = s; tv_usec = u }, metatable)
end

function metatable.__eq(a, b)
  return a.tv_sec == b.tv_sec and a.tv_usec == b.tv_usec
end

function metatable.__lt(a, b)
  if a.tv_sec == b.tv_sec then
    return a.tv_usec < b.tv_usec
  else
    return a.tv_sec < b.tv_sec
  end
end

function metatable.__le(a, b)
  if a.tv_sec == b.tv_sec then
    return a.tv_usec <= b.tv_usec
  else
    return a.tv_sec <= b.tv_sec
  end
end

function metatable.__tostring(self)
  return string.format("%d.%06d", self.tv_sec, self.tv_usec)
end

return function (self)
  return setmetatable(self, metatable)
end
