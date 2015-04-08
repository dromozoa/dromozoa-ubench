local t = {}
local u

local function MOVE(a, b)
  a = b
end

local function LOADK(a)
  a = 42
end

local function LOADBOOL(a)
  a = true
end

local function LOADNIL()
  local a
end

local function GETUPVAL(a)
  a = u
end

local function GETTABUP(a)
  a = t[1]
end

local function GETTABLE(a, b)
  a = b[1]
end

local function SETTABUP(a)
  t[1] = a
end

local function SETUPVAL(a)
  u = a
end

local function NEWTABLE()
  local a = {}
end

local function SELF(a)
  a:f()
end

local function ADD(a, b, c)
  a = b + c
end

local function SUB(a, b, c)
  a = b - c
end

local function MUL(a, b, c)
  a = b * c
end

local function MOD(a, b, c)
  a = b % c
end

local function POW(a, b, c)
  a = b ^ c
end

local function DIV(a, b, c)
  a = b / c
end

local function IDIV(a, b, c)
  a = b // c
end

local function BAND(a, b, c)
  a = b & c
end

local function BOR(a, b, c)
  a = b | c
end

local function BXOR(a, b, c)
  a = b ~ c
end

local function SHL(a, b, c)
  a = b << c
end

local function SHR(a, b, c)
  a = b >> c
end

local function UNM(a, b)
  a = -b
end

local function BNOT(a, b)
  a = ~b
end

local function NOT(a, b)
  a = not b
end

local function LEN(a, b)
  a = #b
end

local function CONCAT(a, b, c)
  a = b .. c
end

local function EQ(a, b)
  if a == b then end
end

local function LT(a, b)
  if a < b then end
end

local function LE(a, b)
  if a <= b then end
end

local function TEST(a)
  if a then end
end

local function TESTSET(a, b, c)
  a = b and c
end

local function FORLOOP(a, b)
  for i = a, b do end
end

local function TFORLOOP(a)
  for i in a do end
end

local function SETLIST(a)
  a = { 42 }
end

local function CLOSURE(a)
  local function f() end
end

local function VARARG(a, ...)
  a = ...
end
