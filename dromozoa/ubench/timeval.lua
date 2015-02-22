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

function timeval_to_number(self)
  return self.tv_sec + self.tv_usec * 0.000001
end

function timeval_to_string(self)
  local s = self.tv_sec
  local u = self.tv_usec
  if s < 0 then
    if u > 0 then
      s = s + 1
      u = 1000000 - u
    end
  end
  return string.format("%d.%06d", s, u)
end

function metatable.__add(a, b)
  if type(a) == "number" then
    return a + timeval_to_number(b)
  elseif type(b) == "number" then
    return timeval_to_number(a) + b
  else
    local s = a.tv_sec + b.tv_sec
    local u = a.tv_usec + b.tv_usec
    if u >= 1000000 then
      s = s + 1
      u = u - 1000000
    end
    return setmetatable({ tv_sec = s; tv_usec = u }, metatable)
  end
end

function metatable.__sub(a, b)
  if type(a) == "number" then
    return a - timeval_to_number(b)
  elseif type(b) == "number" then
    return timeval_to_number(a) - b
  else
    local s = a.tv_sec - b.tv_sec
    local u = a.tv_usec - b.tv_usec
    if u < 0 then
      s = s - 1
      u = u + 1000000
    end
    return setmetatable({ tv_sec = s; tv_usec = u }, metatable)
  end
end

function metatable:__unm()
  local s = -self.tv_sec
  local u = -self.tv_usec
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

metatable.__tostring = timeval_to_string

return function (self)
  self.to_number = timeval_to_number
  self.to_string = timeval_to_string
  return setmetatable(self, metatable)
end
