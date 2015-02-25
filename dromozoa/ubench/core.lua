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

return function (b)
  local math_floor = math.floor
  local math_sin = math.sin
  local string_byte = string.byte
  local table_concat = table.concat
  local table_insert = table.insert

  b:add("identity", function (ctx)
    return ctx
  end, 0)

  b:add("operator.increment", function (ctx)
    return ctx + 1
  end, 0)

  b:add("operator.decrement", function (ctx)
    return ctx - 1
  end, 0)

  b:add("operator.add", function (ctx, a)
    return ctx + a
  end, 0, 0)

  b:add("operator.sub", function (ctx, a)
    return ctx - a
  end, 0, 0)

  b:add("call.lookup", function (ctx)
    return ctx + math.sin(ctx)
  end, 0)

  b:add("call.local", function (ctx)
    return ctx + math_sin(ctx)
  end, 0)

  b:add("array256.empty", function (ctx)
    local data = {}
    for i = 1, 256 do
      data[i] = i
    end
    return data
  end)

  b:add("array256.empty.zero_based", function (ctx)
    local data = {}
    for i = 0, 255 do
      data[i] = i
    end
    return data
  end)

  b:add("array256.empty.length", function (ctx)
    local data = {}
    for i = 0, 255 do
      data[#data + 1] = i
    end
    return data
  end)

  b:add("array256.empty.table_insert", function (ctx)
    local data = {}
    for i = 1, 256 do
      table_insert(data, i)
    end
    return data
  end)

  b:add("array256.constructor", function (ctx)
    local data = {
        1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12,  13,  14,  15,  16,  17,  18,  19,  20,  21,  22,  23,  24,  25,  26,  27,  28,  29,  30,  31,  32,
       33,  34,  35,  36,  37,  38,  39,  40,  41,  42,  43,  44,  45,  46,  47,  48,  49,  50,  51,  52,  53,  54,  55,  56,  57,  58,  59,  60,  61,  62,  63,  64,
       65,  66,  67,  68,  69,  70,  71,  72,  73,  74,  75,  76,  77,  78,  79,  80,  81,  82,  83,  84,  85,  86,  87,  88,  89,  90,  91,  92,  93,  94,  95,  96,
       97,  98,  99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128,
      129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160,
      161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192,
      193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224,
      225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256,
    };
    return data
  end)

  b:add("array256.constructor.false", function (ctx)
    local data = {
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
    };
    for i = 1, 256 do
      data[i] = i
    end
    return data
  end)

  b:add("array256.constructor.zero", function (ctx)
    local data = {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    };
    for i = 1, 256 do
      data[i] = i
    end
    return data
  end)

  b:add("string256.concat", function (ctx)
    local data = ""
    for i = 1, 256 do
      data = data .. "a"
    end
    return data
  end)

  b:add("string256.table_concat", function (ctx)
    local data = {}
    for i = 1, 256 do
      data[i] = "a"
    end
    return table_concat(data)
  end)

  do
    local data = table_concat {
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    }

    b:add("string256.string_byte1", function (ctx)
      for i = 1, #data do
        ctx = ctx + string_byte(data, i)
      end
      return ctx
    end, 0)

    b:add("string256.string_byte2", function (ctx)
      for i = 1, #data, 2 do
        local a, b = string_byte(data, i, i + 1)
        if not b then
          ctx = ctx + a + b
        else
          ctx = ctx + a
        end
      end
      return ctx
    end, 0)

    b:add("string256.string_byte3", function (ctx)
      for i = 1, #data, 3 do
        local a, b, c = string_byte(data, i, i + 2)
        if not b then
          if a then ctx = ctx + a end
        else
          ctx = ctx + a + b
          if c then ctx = ctx + c end
        end
      end
      return ctx
    end, 0)

    b:add("string256.string_byte4", function (ctx)
      for i = 1, #data, 4 do
        local a, b, c, d = string_byte(data, i, i + 3)
        if not d then
          ctx = ctx + a + b + c + d
        else
          if not b then
            if a then ctx = ctx + a end
          else
            ctx = ctx + a + b
            if c then ctx = ctx + c end
          end
        end
      end
      return ctx
    end, 0)

    b:add("string256.string_byte7", function (ctx)
      for i = 1, #data, 7 do
        local a, b, c, d, e, f, g = string_byte(data, i, i + 6)
        if not d then
          if not b then
            if a then ctx = ctx + a end
          else
            ctx = ctx + a + b
            if c then ctx = ctx + c end
          end
        else
          ctx = ctx + a + b + c + d
          if not f then
            if e then ctx = ctx + e end
          else
            ctx = ctx + e + f
            if f then ctx = ctx + f end
          end
        end
      end
      return ctx
    end, 0)

    b:add("string256.string_byte8", function (ctx)
      for i = 1, #data, 8 do
        local a, b, c, d, e, f, g = string_byte(data, i, i + 7)
        if not g then
          ctx = ctx + a + b + c + d + e + f + g
        else
          if not d then
            if not b then
              if a then ctx = ctx + a end
            else
              ctx = ctx + a + b
              if c then ctx = ctx + c end
            end
          else
            ctx = ctx + a + b + c + d
            if not f then
              if e then ctx = ctx + e end
            else
              ctx = ctx + e + f
              if f then ctx = ctx + f end
            end
          end
        end
      end
      return ctx
    end, 0)

    if utf8 ~= nil then
      local utf8_codes = utf8.codes
      b:add("string256.utf8_codes", function (ctx)
        for p, c in utf8_codes(data) do
          ctx = ctx + c
        end
        return ctx
      end, 0)
    end
  end

  b:add("case16.identity", function (ctx)
    local v = ctx % 16 + 1
    return ctx + v
  end, 0)

  b:add("case16.linear", function (ctx)
    local v = ctx % 16 + 1
    if v == 1 then return ctx + 1
    elseif v ==  2 then return ctx +  2
    elseif v ==  3 then return ctx +  3
    elseif v ==  4 then return ctx +  4
    elseif v ==  5 then return ctx +  5
    elseif v ==  6 then return ctx +  6
    elseif v ==  7 then return ctx +  7
    elseif v ==  8 then return ctx +  8
    elseif v ==  9 then return ctx +  9
    elseif v == 10 then return ctx + 10
    elseif v == 11 then return ctx + 11
    elseif v == 12 then return ctx + 12
    elseif v == 13 then return ctx + 13
    elseif v == 14 then return ctx + 14
    elseif v == 15 then return ctx + 15
    elseif v == 16 then return ctx + 16 end
  end, 0)

  b:add("case16.binary", function (ctx)
    local v = ctx % 16 + 1
    if v <= 8 then
      if v <= 4 then
        if v <= 2 then
          if v == 1 then return ctx + 1 else return ctx + 2 end
        else
          if v == 3 then return ctx + 3 else return ctx + 4 end
        end
      else
        if v <= 6 then
          if v == 5 then return ctx + 5 else return ctx + 6 end
        else
          if v == 7 then return ctx + 7 else return ctx + 8 end
        end
      end
    else
      if v <= 12 then
        if v <= 10 then
          if v == 9 then return ctx + 9 else return ctx + 10 end
        else
          if v == 11 then return ctx + 11 else return ctx + 12 end
        end
      else
        if v <= 14 then
          if v == 13 then return ctx + 13 else return ctx + 14 end
        else
          if v == 15 then return ctx + 15 else return ctx + 16 end
        end
      end
    end
  end, 0)

  do
    local data = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 }
    b:add("case16.lookup", function (ctx)
      local v = ctx % 16 + 1
      return ctx + data[v]
    end, 0)
  end

  b:add("test", function (ctx, a)
    if a then
      ctx = ctx + 1
    else
      ctx = ctx + 2
    end
    return ctx + 1
  end, 0)

  b:add("test.not", function (ctx, a)
    if not a then
      ctx = ctx + 1
    else
      ctx = ctx + 2
    end
    return ctx + 1
  end, 0)

  b:add("test.not_not", function (ctx, a)
    if not not a then
      ctx = ctx + 1
    else
      ctx = ctx + 2
    end
    return ctx + 1
  end, 0)

  b:add("test.eq_nil", function (ctx, a)
    if a == nil then
      ctx = ctx + 1
    else
      ctx = ctx + 2
    end
    return ctx + 1
  end, 0)

  b:add("test.ne_nil", function (ctx, a)
    if a ~= nil then
      ctx = ctx + 1
    else
      ctx = ctx + 2
    end
    return ctx + 1
  end, 0)

  b:add("floor.floor", function (ctx)
    local v = math_floor(ctx)
    return v + 0.5
  end, 42.5)

  b:add("floor.mod", function (ctx)
    local v = ctx - ctx % 1
    return v + 0.5
  end, 42.5)

  b:add("is_integer.floor", function (ctx)
    if math_floor(ctx) == ctx then
      return ctx
    end
  end, 42)

  b:add("is_integer.mod", function (ctx)
    if ctx % 1 == 0 then
      return ctx
    end
  end, 42)
end
