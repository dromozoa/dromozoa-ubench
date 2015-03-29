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

local gettimeofday = require "dromozoa.ubench.gettimeofday"

local collectgarbage = collectgarbage

return function (n, fn)
  collectgarbage()
  collectgarbage()

  local tv1 = gettimeofday()
  for i = 1, n do
    fn()
  end
  local tv2 = gettimeofday()

  local s = tv2.tv_sec - tv1.tv_sec
  local u = tv2.tv_usec - tv1.tv_usec
  if u < 0 then
    s = s - 1
    u = u + 1000000
  end
  return s * 1000000 + u
end
