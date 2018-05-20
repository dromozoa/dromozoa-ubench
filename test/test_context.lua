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

local context = require "dromozoa.ubench.context"

local verbose = os.getenv "VERBOSE" == "1"

local function dump(ctx, key)
  io.stderr:write((" %-15s | "):format(key))
  local value = ctx[key]
  local t = type(value)
  if t == "nil" then
    io.stderr:write "nil"
  elseif t == "boolean" then
    if value then
      io.stderr:write "true"
    else
      io.stderr:write "false"
    end
  elseif t == "table" then
    io.stderr:write(table.concat(value, " "))
  else
    io.stderr:write(value)
  end
  io.stderr:write "\n"
end

local ctx = context()
ctx:initialize()

if verbose then
  io.stderr:write [[
 Name            | Value
-----------------|-----------------
]]
  dump(ctx, "scaling_govener")
  dump(ctx, "affinity")
  dump(ctx, "scheduler")
  dump(ctx, "param")
  dump(ctx, "mlockall")
end

ctx:terminate()
