-- Copyright (C) 2015,2017,2018 Tomoyuki Fujimori <moyu@dromozoa.com>
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

return {
  context = require "dromozoa.ubench.context";
  dump = require "dromozoa.ubench.dump";
  linest = require "dromozoa.ubench.linest";
  max = require "dromozoa.ubench.max";
  min = require "dromozoa.ubench.min";
  run = require "dromozoa.ubench.run";
  report = require "dromozoa.ubench.report";
  stdev = require "dromozoa.ubench.stdev";
}
