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

local ubench = require "dromozoa.ubench"
local tarai = require "dromozoa.ubench.tarai"

local b = ubench()
b:add("identity", function (ctx) return ctx end)
b:add("increment", function (ctx) return ctx + 1 end, 0)
b:add("decrement", function (ctx) return ctx - 1 end, 0)
b:add("tarai(2,1,0)", function (ctx, ...) return ctx, tarai(...) end, 0, 2, 1, 0)
b:add("tarai(4,2,0)", function (ctx, ...) return ctx, tarai(...) end, 0, 4, 2, 0)
b:add("tarai(6,3,0)", function (ctx, ...) return ctx, tarai(...) end, 0, 6, 3, 0)
b:add("tarai(8,4,0)", function (ctx, ...) return ctx, tarai(...) end, 0, 8, 4, 0)
b:run()
