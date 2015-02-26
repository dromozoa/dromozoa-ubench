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
local core = require "dromozoa.ubench.core"
local tarai = require "dromozoa.ubench.tarai"

local b = ubench()
core(b)
b:add("tarai2", function (ctx, ...) return ctx, tarai(...) end, 0, 2, 1, 0)
b:add("tarai4", function (ctx, ...) return ctx, tarai(...) end, 0, 4, 2, 0)
b:add("tarai6", function (ctx, ...) return ctx, tarai(...) end, 0, 6, 3, 0)
b:add("tarai8", function (ctx, ...) return ctx, tarai(...) end, 0, 8, 4, 0)
b:run()
