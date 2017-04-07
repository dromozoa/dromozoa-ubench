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

local uint32 = require "dromozoa.commons.uint32"
local unix = require "dromozoa.unix"

local class = {}

function class.new()
  return {}
end

function class:initialize()
  local pid = assert(unix.getpid())

  if unix.sched_setaffinity then
    local affinity = assert(unix.sched_getaffinity(pid))
    local result, message = unix.sched_setaffinity(pid, { 3 })
    if result then
      self.affinity = affinity
    else
      io.stderr:write("could not sched_setaffinity: ", message, "\n")
    end
  end

  if unix.sched_setscheduler then
    local scheduler = assert(unix.sched_getscheduler(pid))
    local param = assert(unix.sched_getparam(pid))
    local result, message = unix.sched_setscheduler(pid, unix.SCHED_FIFO, {
      sched_priority = assert(unix.sched_get_priority_max(unix.SCHED_FIFO)) - 1;
    })
    if result then
      self.scheduler = scheduler
      self.param = param
    else
      io.stderr:write("could not sched_setscheduler: ", message, "\n")
    end
  end

  if unix.mlockall then
    local result, message = unix.mlockall(uint32.bor(unix.MCL_CURRENT, unix.MCL_FUTURE))
    if result then
      self.mlockall = true
    else
      io.stderr:write("could not mlockall: ", message, "\n")
    end
  end

  return self
end

function class:terminate()
  local pid = assert(unix.getpid())

  if self.affinity then
    assert(unix.sched_setaffinity(pid, self.affinity))
    self.affinity = nil
  end

  if self.scheduler then
    assert(unix.sched_setscheduler(pid, self.scheduler, self.param))
    self.scheduler = nil
    self.param = nil
  end

  if self.mlockall then
    assert(self.munlockall())
    self.mlockall = nil
  end

  return self
end

class.metatable = {
  __index = class;
}

return setmetatable(class, {
  __call = function ()
    return setmetatable(class.new(), class.metatable)
  end;
})
