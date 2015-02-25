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
local timeval = require "dromozoa.ubench.timeval"

local function run1(n, fn, ctx, ...)
  collectgarbage("collect")
  collectgarbage("stop")

  local t1 = ubench.gettimeofday()
  for i = 1, n do
    ctx = fn(ctx, ...)
  end
  local t2 = ubench.gettimeofday()

  collectgarbage("collect")
  collectgarbage("restart")

  return timeval(t2) - timeval(t1) + 0
end

local function run(fn, ctx, ...)
  local n = 1
  while true do
    local t = run1(n, fn, ctx, ...)
    if 0.0009 <= t and t <= 0.0011 then
      break
    end
    local m = math.max(math.floor(n * 0.001 / t), 1)
    if n == m then
      break
    end
    print(string.format("n: %d, m: %d, t: %.9f", n, m, t))
    n = m
  end

  print(string.format("n: %d", n))

  local data = {}
  for i = 1, 1000 do
    data[i] = run1(n, fn, ctx, ...)
  end

  table.sort(data)

  local a = 0
  for i = 126, 375 do
    a = a + data[i]
  end
  local a = a / 250

  local b = 0
  for i = 126, 375 do
    b = b + (data[i] - a) ^ 2
  end
  local b = b ^ 0.5

  print(string.format("%.9f %.9f (%.2f)", a, a / n, b * 100))
end

-- ubench:register("tarai320", function (ctx, x, y, z) return tarai(x, y, z) end, nil, 3, 2, 0)
-- ubench:run()
-- ubench:save("ubench.json")

run(function (ctx, x, y, z) return tarai(x, y, z) end, nil, 3, 2, 0)

--[[
マイクロ秒単位で経過時間を計測する
傾きが1以下のものを探す

1/8 - 3/8
2/16 - 6/16

8/1 - 8/3

試行回数が0.1ms-1.0msになるように調整する
1000回実行する
1/8 - 3/8を採用し、平均、分散を計算する
1回あたりの平均処理時間を計算する

1msec程度になるように回数を調整する
1000回実行する


]]
