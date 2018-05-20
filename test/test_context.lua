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

local ubench = require "dromozoa.ubench"

local verbose = os.getenv "VERBOSE" == "1"

local function dump(context, key)
  io.stderr:write((" %-16s | "):format(key))
  local value = context[key]
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

local context = ubench.context()
context:initialize()

if verbose then
  io.stderr:write [[
 Name            | Value
-----------------|-----------------
]]
  dump(context, "scaling_governor")
  dump(context, "affinity")
  dump(context, "scheduler")
  dump(context, "param")
  dump(context, "mlockall")
end

context:terminate()
