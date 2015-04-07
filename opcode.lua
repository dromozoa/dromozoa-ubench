local math_random = math.random
local math_randomseed = math.randomseed
local table_concat = table.concat
local table_unpack = table.unpack or unpack

math_randomseed(42)

local phonetic_alphabet = {
  "alfa", "bravo", "charlie", "delta", "echo",
  "foxtrot", "golf", "hotel", "india", "juliett",
  "kilo", "lima", "mike", "november", "oscar",
  "papa", "quebec", "romeo", "sierra", "tango",
  "uniform", "victor", "whiskey", "xray", "yankee",
  "zulu",
}

local function make_integer_array(m, n)
  local data = {}
  for i = 1, m do
    data[i] = math_random(n)
  end
  return data
end

local function make_number_array(m)
  local data = {}
  for i = 1, m do
    data[i] = math_random()
  end
  return data
end

local function make_string_array(m, n)
  local data = {}
  for i = 1, m do
    local buffer = {}
    for j = 1, n do
      buffer[j] = phonetic_alphabet[math_random(26)]
    end
    data[i] = table_concat(buffer, "_")
  end
  return data
end

local function make_boolean_array(m)
  local data = {}
  for i = 1, m do
    data[i] = math_random(2) == 1
  end
  return data
end

local function alfa   () return 1 end
local function bravo  () return 2 end
local function charlie() return 3 end
local function delta  () return 4 end
local function echo   () return 5 end
local function foxtrot() return 6 end
local function golf   () return 7 end
local function hotel  () return 8 end

local this = {
  alfa    = alfa;
  bravo   = bravo;
  charlie = charlie;
  delta   = delta;
  echo    = echo;
  foxtrot = foxtrot;
  golf    = golf;
  hotel   = hotel;
}

local opcode = {}

function opcode.add()
  local r01, r02, r03, r04, r05, r06, r07, r08, r09, r10, r11, r12, r13, r14, r15, r16
  local d01, d02, d03, d04, d05, d06, d07, d08, d09, d10, d11, d12, d13, d14, d15, d16 = table_unpack(make_integer_array(16, 65536))
  local n01, n02, n03, n04, n05, n06, n07, n08, n09, n10, n11, n12, n13, n14, n15, n16 = table_unpack(make_number_array(16))
  local b01, b02, b03, b04, b05, b06, b07, b08, b09, b10, b11, b12, b13, b14, b15, b16 = table_unpack(make_boolean_array(16))
  local this = this

--[[
  r01 = d01 + d02
  r02 = d03 + d04
  r03 = d05 + d06
  r04 = d07 + d08
  r05 = d09 + d10
  r06 = d11 + d12
  r07 = d13 + d14
  r08 = d15 + d16
]]

  r01 = this:alfa()
  r02 = this:bravo()
  r03 = this:charlie()
  r04 = this:delta()
  r05 = this:echo()
  r06 = this:foxtrot()
  r07 = this:golf()
  r08 = this:hotel()
end

local function f() end
local function g() end

print(f)
print(g)
print(f == f)
print(f == g)

return opcode
