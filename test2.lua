local uint32 = require "dromozoa.commons.uint32"
local unix = require "dromozoa.unix"
local ubench = require "dromozoa.ubench"

local function f(t, x)
  t[1] = x
  t[2] = x
  t[3] = x
  t[4] = x
  x = t[1] + t[2] + t[3] + t[4]
  return t, x
end

assert(ubench.setaffinity(0, { 3 }))
-- print(ubench.get_priority_max(ubench.SCHED_FIFO))
assert(ubench.setscheduler(0, ubench.SCHED_FIFO, ubench.get_priority_max(ubench.SCHED_FIFO)))

local data = {}
local N = 1000

for i = 1, N do
  data[i] = 0
end

local flags = uint32.bor(ubench.MCL_CURRENT, ubench.MCL_FUTURE)

local timer = ubench.timer()
local t = { 0, 0, 0, 0 }
local x = 42.0

collectgarbage("stop")

ubench.mlockall(flags, 1024 * 1024)

for i = 1, N do
  collectgarbage()
  collectgarbage()

  timer:restart()
  for j = 1, 1000 do
    t, x = f(t, x)
    x = x * 0.25
  end
  data[i] = timer:elapsed()
end

ubench.munlockall()

for i = 1, N do
  print(("%.17g"):format(data[i]))
end
