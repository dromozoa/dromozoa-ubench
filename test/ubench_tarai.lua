-- Copyright (C) 2018 Tomoyuki Fujimori <moyu@dromozoa.com>
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

local function tarai(x, y, z)
  if x <= y then
    return y
  else
    return tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y))
  end
end

return {
  { "tarai( 4,2,1)", function (context, x, y, z) return context + tarai(x, y, z) end, 0,  4, 2, 1 };
  { "tarai( 8,4,2)", function (context, x, y, z) return context + tarai(x, y, z) end, 0,  8, 4, 2 };
  { "tarai(12,6,3)", function (context, x, y, z) return context + tarai(x, y, z) end, 0, 12, 8, 3 };
}
