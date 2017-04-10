-- Copyright (C) 2017 Tomoyuki Fujimori <moyu@dromozoa.com>
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

local function fibonacci(n)
  if n < 2 then
    return n
  else
    return fibonacci(n - 2) + fibonacci(n - 1)
  end
end

local function tarai(x, y, z)
  if x <= y then
    return y
  else
    return tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y))
  end
end

return {
  fib4 = { function (_, n) fibonacci(n) end, nil, 4 };
  fib5 = { function (_, n) fibonacci(n) end, nil, 5 };
  fib6 = { function (_, n) fibonacci(n) end, nil, 6 };
  fib7 = { function (_, n) fibonacci(n) end, nil, 7 };
  tarai4 = { function (_, n) tarai(n * 2, n, n) end, nil, 4 };
  tarai5 = { function (_, n) tarai(n * 2, n, n) end, nil, 5 };
  tarai6 = { function (_, n) tarai(n * 2, n, n) end, nil, 6 };
  tarai7 = { function (_, n) tarai(n * 2, n, n) end, nil, 7 };
}
