
local math_random = math.random
local math_randomseed = math.randomseed
local string_format = string.format
local table_concat = table.concat

math_randomseed(42)

local phonetic_alphabet = {
  "alfa", "bravo", "charlie", "delta", "echo",
  "foxtrot", "golf", "hotel", "india", "juliett",
  "kilo", "lima", "mike", "november", "oscar",
  "papa", "quebec", "romeo", "sierra", "tango",
  "uniform", "victor", "whiskey", "xray", "yankee",
  "zulu",
}

local function random_string()
  local buffer = {}
  for i = 1, 4 do
    buffer[i] = phonetic_alphabet[math_random(26)]
  end
  return string_format("%q", table_concat(buffer, "_"))
end

local function random_integer()
  return tostring(math_random(65536))
end

local function random_number()
  return tostring(math_random())
end

local function random_boolean()
  return tostring(math_random(2) == 1)
end

local function generate_register(out, n, format, fn)
  for i = 1, n do
    out:write("local ", string_format(format, i))
    if fn then
      out:write(" = ", fn())
    end
    out:write("\n")
  end
end



local function generate_common(out)
  generate_register(out, 8, "r%02d")
  generate_register(out, 8, "d%02d", random_integer)
  -- generate_register(out, 8, "n%02d", random_number)
  -- generate_register(out, 8, "s%02d", random_string)
  -- generate_register(out, 8, "b%02d", random_boolean)
  for i = 1, 8 do
    out:write(string_format("r%02d = d%02d\n", i, i))
  end
  out:write "return {\n"
  for i = 1, 8 do
    out:write(string_format("r%02d,\n", i))
  end
  out:write "}\n"
end

generate_common(io.stdout)

