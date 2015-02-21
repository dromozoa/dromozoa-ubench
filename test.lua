local ubench = require "dromozoa.ubench"

assert(ubench.RUSAGE_SELF)
assert(ubench.RUSAGE_CHILDREN)

local function timeval_sub(a, b)
  local s = a.tv_sec - b.tv_sec
  local u = a.tv_usec - b.tv_usec
  if u < 0 then
    s = s - 1
    u = u + 1000000
  end
  return { tv_sec = s; tv_usec = u }
end

local function timeval_tostring(v)
  return string.format("%d.%06d", v.tv_sec, v.tv_usec)
end

local function tarai(x, y, z)
  if x <= y then
    return y
  else
    return tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y))
  end
end

local tv1 = ubench.gettimeofday()
local ru1 = ubench.getrusage(ubench.RUSAGE_SELF)

tarai(8, 4, 0)

local tv2 = ubench.gettimeofday()
local ru2 = ubench.getrusage(ubench.RUSAGE_SELF)

print("tv", timeval_tostring(timeval_sub(tv2, tv1)))
print("ut", timeval_tostring(timeval_sub(ru2.ru_utime, ru1.ru_utime)))
print("st", timeval_tostring(timeval_sub(ru2.ru_stime, ru1.ru_stime)))
