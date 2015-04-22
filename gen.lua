local function add(a, b)
  return a + b
end

-- GETUPVAL
-- MOVE
-- MOVE
-- CALL
--   ADD
--   RETURN
-- RETURN
local function call(a, b)
  local out = add(a, b)
  return out
end

-- GETUPVAL
-- MOVE
-- MOVE
-- TAILCALL
--   ADD
--   RETURN
-- RETURN
local function tailcall(a, b)
  return add(a, b)
end

-- GETUPVAL
-- MOVE
-- MOVE
-- ADD
-- RETURN
local function inline(a, b)
  local out, a, b = add, a, b
  out = a + b
  return out
end

local un = 1, 2
local ut = { 1, 2, 3, 4, 5, 6, 7, 8 }
local ubench = {}
ubench[#ubench + 1] = { "NOOP/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline




end, {
} }
ubench[#ubench + 1] = { "NOOP/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline








end, {
} }
ubench[#ubench + 1] = { "NOOP/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline












end, {
} }
ubench[#ubench + 1] = { "NOOP/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
















end, {
} }
ubench[#ubench + 1] = { "NOOP/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline




















end, {
} }
ubench[#ubench + 1] = { "NOOP/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
























end, {
} }
ubench[#ubench + 1] = { "NOOP/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline




























end, {
} }
ubench[#ubench + 1] = { "NOOP/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
































end, {
} }
ubench[#ubench + 1] = { "MOVE/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1
out = n1
out = n1
out = n1
end, {
} }
ubench[#ubench + 1] = { "MOVE/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
end, {
} }
ubench[#ubench + 1] = { "MOVE/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
end, {
} }
ubench[#ubench + 1] = { "MOVE/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
end, {
} }
ubench[#ubench + 1] = { "MOVE/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
end, {
} }
ubench[#ubench + 1] = { "MOVE/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
end, {
} }
ubench[#ubench + 1] = { "MOVE/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
end, {
} }
ubench[#ubench + 1] = { "MOVE/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
out = n1
end, {
} }
ubench[#ubench + 1] = { "LOADK/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = 42
out = 42
out = 42
out = 42
end, {
} }
ubench[#ubench + 1] = { "LOADK/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
end, {
} }
ubench[#ubench + 1] = { "LOADK/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
end, {
} }
ubench[#ubench + 1] = { "LOADK/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
end, {
} }
ubench[#ubench + 1] = { "LOADK/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
end, {
} }
ubench[#ubench + 1] = { "LOADK/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
end, {
} }
ubench[#ubench + 1] = { "LOADK/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
end, {
} }
ubench[#ubench + 1] = { "LOADK/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
out = 42
end, {
} }
ubench[#ubench + 1] = { "LOADBOOL/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = true
out = true
out = true
out = true
end, {
} }
ubench[#ubench + 1] = { "LOADBOOL/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
end, {
} }
ubench[#ubench + 1] = { "LOADBOOL/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
end, {
} }
ubench[#ubench + 1] = { "LOADBOOL/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
end, {
} }
ubench[#ubench + 1] = { "LOADBOOL/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
end, {
} }
ubench[#ubench + 1] = { "LOADBOOL/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
end, {
} }
ubench[#ubench + 1] = { "LOADBOOL/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
end, {
} }
ubench[#ubench + 1] = { "LOADBOOL/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
out = true
end, {
} }
ubench[#ubench + 1] = { "GETUPVAL/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = un
out = un
out = un
out = un
end, {
} }
ubench[#ubench + 1] = { "GETUPVAL/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
end, {
} }
ubench[#ubench + 1] = { "GETUPVAL/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
end, {
} }
ubench[#ubench + 1] = { "GETUPVAL/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
end, {
} }
ubench[#ubench + 1] = { "GETUPVAL/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
end, {
} }
ubench[#ubench + 1] = { "GETUPVAL/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
end, {
} }
ubench[#ubench + 1] = { "GETUPVAL/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
end, {
} }
ubench[#ubench + 1] = { "GETUPVAL/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
out = un
end, {
} }
ubench[#ubench + 1] = { "GETTABUP/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABUP/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABUP/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABUP/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABUP/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABUP/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABUP/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABUP/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
out = ut[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABLE/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABLE/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABLE/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABLE/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABLE/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABLE/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABLE/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
end, {
} }
ubench[#ubench + 1] = { "GETTABLE/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
out = t[n1]
end, {
} }
ubench[#ubench + 1] = { "SETUPVAL/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
un = n1
un = n1
un = n1
un = n1
end, {
} }
ubench[#ubench + 1] = { "SETUPVAL/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
end, {
} }
ubench[#ubench + 1] = { "SETUPVAL/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
end, {
} }
ubench[#ubench + 1] = { "SETUPVAL/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
end, {
} }
ubench[#ubench + 1] = { "SETUPVAL/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
end, {
} }
ubench[#ubench + 1] = { "SETUPVAL/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
end, {
} }
ubench[#ubench + 1] = { "SETUPVAL/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
end, {
} }
ubench[#ubench + 1] = { "SETUPVAL/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
un = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABUP/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABUP/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABUP/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABUP/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABUP/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABUP/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABUP/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABUP/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
ut[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABLE/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABLE/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABLE/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABLE/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABLE/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABLE/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABLE/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "SETTABLE/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
t[n1] = n1
end, {
} }
ubench[#ubench + 1] = { "NEWTABLE/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = {}
out = {}
out = {}
out = {}
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "NEWTABLE/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "NEWTABLE/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "NEWTABLE/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "NEWTABLE/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "NEWTABLE/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "NEWTABLE/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "NEWTABLE/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
out = {}
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "ADD/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
end, {
} }
ubench[#ubench + 1] = { "ADD/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
end, {
} }
ubench[#ubench + 1] = { "ADD/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
end, {
} }
ubench[#ubench + 1] = { "ADD/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
end, {
} }
ubench[#ubench + 1] = { "ADD/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
end, {
} }
ubench[#ubench + 1] = { "ADD/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
end, {
} }
ubench[#ubench + 1] = { "ADD/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
end, {
} }
ubench[#ubench + 1] = { "ADD/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
out = n1 + n2
end, {
} }
ubench[#ubench + 1] = { "SUB/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
end, {
} }
ubench[#ubench + 1] = { "SUB/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
end, {
} }
ubench[#ubench + 1] = { "SUB/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
end, {
} }
ubench[#ubench + 1] = { "SUB/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
end, {
} }
ubench[#ubench + 1] = { "SUB/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
end, {
} }
ubench[#ubench + 1] = { "SUB/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
end, {
} }
ubench[#ubench + 1] = { "SUB/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
end, {
} }
ubench[#ubench + 1] = { "SUB/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
out = n1 - n2
end, {
} }
ubench[#ubench + 1] = { "MUL/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
end, {
} }
ubench[#ubench + 1] = { "MUL/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
end, {
} }
ubench[#ubench + 1] = { "MUL/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
end, {
} }
ubench[#ubench + 1] = { "MUL/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
end, {
} }
ubench[#ubench + 1] = { "MUL/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
end, {
} }
ubench[#ubench + 1] = { "MUL/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
end, {
} }
ubench[#ubench + 1] = { "MUL/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
end, {
} }
ubench[#ubench + 1] = { "MUL/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
out = n1 * n2
end, {
} }
ubench[#ubench + 1] = { "MOD/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
end, {
} }
ubench[#ubench + 1] = { "MOD/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
end, {
} }
ubench[#ubench + 1] = { "MOD/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
end, {
} }
ubench[#ubench + 1] = { "MOD/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
end, {
} }
ubench[#ubench + 1] = { "MOD/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
end, {
} }
ubench[#ubench + 1] = { "MOD/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
end, {
} }
ubench[#ubench + 1] = { "MOD/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
end, {
} }
ubench[#ubench + 1] = { "MOD/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
out = n1 % n2
end, {
} }
ubench[#ubench + 1] = { "POW/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
end, {
} }
ubench[#ubench + 1] = { "POW/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
end, {
} }
ubench[#ubench + 1] = { "POW/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
end, {
} }
ubench[#ubench + 1] = { "POW/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
end, {
} }
ubench[#ubench + 1] = { "POW/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
end, {
} }
ubench[#ubench + 1] = { "POW/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
end, {
} }
ubench[#ubench + 1] = { "POW/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
end, {
} }
ubench[#ubench + 1] = { "POW/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
out = n1 ^ n2
end, {
} }
ubench[#ubench + 1] = { "DIV/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
end, {
} }
ubench[#ubench + 1] = { "DIV/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
end, {
} }
ubench[#ubench + 1] = { "DIV/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
end, {
} }
ubench[#ubench + 1] = { "DIV/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
end, {
} }
ubench[#ubench + 1] = { "DIV/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
end, {
} }
ubench[#ubench + 1] = { "DIV/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
end, {
} }
ubench[#ubench + 1] = { "DIV/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
end, {
} }
ubench[#ubench + 1] = { "DIV/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
out = n1 / n2
end, {
} }
ubench[#ubench + 1] = { "IDIV/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
end, {
} }
ubench[#ubench + 1] = { "IDIV/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
end, {
} }
ubench[#ubench + 1] = { "IDIV/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
end, {
} }
ubench[#ubench + 1] = { "IDIV/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
end, {
} }
ubench[#ubench + 1] = { "IDIV/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
end, {
} }
ubench[#ubench + 1] = { "IDIV/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
end, {
} }
ubench[#ubench + 1] = { "IDIV/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
end, {
} }
ubench[#ubench + 1] = { "IDIV/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
out = n1 // n2
end, {
} }
ubench[#ubench + 1] = { "BAND/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
end, {
} }
ubench[#ubench + 1] = { "BAND/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
end, {
} }
ubench[#ubench + 1] = { "BAND/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
end, {
} }
ubench[#ubench + 1] = { "BAND/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
end, {
} }
ubench[#ubench + 1] = { "BAND/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
end, {
} }
ubench[#ubench + 1] = { "BAND/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
end, {
} }
ubench[#ubench + 1] = { "BAND/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
end, {
} }
ubench[#ubench + 1] = { "BAND/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
out = n1 & n2
end, {
} }
ubench[#ubench + 1] = { "BOR/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
end, {
} }
ubench[#ubench + 1] = { "BOR/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
end, {
} }
ubench[#ubench + 1] = { "BOR/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
end, {
} }
ubench[#ubench + 1] = { "BOR/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
end, {
} }
ubench[#ubench + 1] = { "BOR/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
end, {
} }
ubench[#ubench + 1] = { "BOR/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
end, {
} }
ubench[#ubench + 1] = { "BOR/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
end, {
} }
ubench[#ubench + 1] = { "BOR/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
out = n1 | n2
end, {
} }
ubench[#ubench + 1] = { "BXOR/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
end, {
} }
ubench[#ubench + 1] = { "BXOR/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
end, {
} }
ubench[#ubench + 1] = { "BXOR/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
end, {
} }
ubench[#ubench + 1] = { "BXOR/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
end, {
} }
ubench[#ubench + 1] = { "BXOR/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
end, {
} }
ubench[#ubench + 1] = { "BXOR/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
end, {
} }
ubench[#ubench + 1] = { "BXOR/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
end, {
} }
ubench[#ubench + 1] = { "BXOR/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
out = n1 ~ n2
end, {
} }
ubench[#ubench + 1] = { "SHL/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
end, {
} }
ubench[#ubench + 1] = { "SHL/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
end, {
} }
ubench[#ubench + 1] = { "SHL/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
end, {
} }
ubench[#ubench + 1] = { "SHL/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
end, {
} }
ubench[#ubench + 1] = { "SHL/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
end, {
} }
ubench[#ubench + 1] = { "SHL/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
end, {
} }
ubench[#ubench + 1] = { "SHL/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
end, {
} }
ubench[#ubench + 1] = { "SHL/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
out = n1 << n2
end, {
} }
ubench[#ubench + 1] = { "SHR/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
end, {
} }
ubench[#ubench + 1] = { "SHR/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
end, {
} }
ubench[#ubench + 1] = { "SHR/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
end, {
} }
ubench[#ubench + 1] = { "SHR/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
end, {
} }
ubench[#ubench + 1] = { "SHR/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
end, {
} }
ubench[#ubench + 1] = { "SHR/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
end, {
} }
ubench[#ubench + 1] = { "SHR/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
end, {
} }
ubench[#ubench + 1] = { "SHR/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
out = n1 >> n2
end, {
} }
ubench[#ubench + 1] = { "UNM/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = -n1
out = -n1
out = -n1
out = -n1
end, {
} }
ubench[#ubench + 1] = { "UNM/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
end, {
} }
ubench[#ubench + 1] = { "UNM/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
end, {
} }
ubench[#ubench + 1] = { "UNM/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
end, {
} }
ubench[#ubench + 1] = { "UNM/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
end, {
} }
ubench[#ubench + 1] = { "UNM/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
end, {
} }
ubench[#ubench + 1] = { "UNM/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
end, {
} }
ubench[#ubench + 1] = { "UNM/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
out = -n1
end, {
} }
ubench[#ubench + 1] = { "BNOT/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ~n1
out = ~n1
out = ~n1
out = ~n1
end, {
} }
ubench[#ubench + 1] = { "BNOT/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
end, {
} }
ubench[#ubench + 1] = { "BNOT/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
end, {
} }
ubench[#ubench + 1] = { "BNOT/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
end, {
} }
ubench[#ubench + 1] = { "BNOT/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
end, {
} }
ubench[#ubench + 1] = { "BNOT/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
end, {
} }
ubench[#ubench + 1] = { "BNOT/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
end, {
} }
ubench[#ubench + 1] = { "BNOT/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
out = ~n1
end, {
} }
ubench[#ubench + 1] = { "NOT/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = not b0
out = not b0
out = not b0
out = not b0
end, {
} }
ubench[#ubench + 1] = { "NOT/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
end, {
} }
ubench[#ubench + 1] = { "NOT/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
end, {
} }
ubench[#ubench + 1] = { "NOT/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
end, {
} }
ubench[#ubench + 1] = { "NOT/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
end, {
} }
ubench[#ubench + 1] = { "NOT/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
end, {
} }
ubench[#ubench + 1] = { "NOT/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
end, {
} }
ubench[#ubench + 1] = { "NOT/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
out = not b0
end, {
} }
ubench[#ubench + 1] = { "LEN/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = #s1
out = #s1
out = #s1
out = #s1
end, {
} }
ubench[#ubench + 1] = { "LEN/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
end, {
} }
ubench[#ubench + 1] = { "LEN/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
end, {
} }
ubench[#ubench + 1] = { "LEN/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
end, {
} }
ubench[#ubench + 1] = { "LEN/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
end, {
} }
ubench[#ubench + 1] = { "LEN/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
end, {
} }
ubench[#ubench + 1] = { "LEN/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
end, {
} }
ubench[#ubench + 1] = { "LEN/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
out = #s1
end, {
} }
ubench[#ubench + 1] = { "CONCAT/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
end, {
["MOVE"] = 2;
} }
ubench[#ubench + 1] = { "CONCAT/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
end, {
["MOVE"] = 2;
} }
ubench[#ubench + 1] = { "CONCAT/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
end, {
["MOVE"] = 2;
} }
ubench[#ubench + 1] = { "CONCAT/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
end, {
["MOVE"] = 2;
} }
ubench[#ubench + 1] = { "CONCAT/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
end, {
["MOVE"] = 2;
} }
ubench[#ubench + 1] = { "CONCAT/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
end, {
["MOVE"] = 2;
} }
ubench[#ubench + 1] = { "CONCAT/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
end, {
["MOVE"] = 2;
} }
ubench[#ubench + 1] = { "CONCAT/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
out = s1 .. s2
end, {
["MOVE"] = 2;
} }
ubench[#ubench + 1] = { "EQ/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "EQ/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "EQ/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "EQ/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "EQ/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "EQ/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "EQ/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "EQ/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
if n1 == n1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LT/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LT/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LT/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LT/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LT/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LT/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LT/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LT/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
if n1 < n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LE/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LE/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LE/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LE/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LE/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LE/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LE/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "LE/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
if n1 <= n2 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "TEST/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "TEST/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "TEST/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "TEST/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "TEST/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "TEST/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "TEST/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "TEST/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
if b1 then out = n1 + n2 end
end, {
["ADD"] = 1;
} }
ubench[#ubench + 1] = { "TESTSET/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
end, {
} }
ubench[#ubench + 1] = { "TESTSET/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
end, {
} }
ubench[#ubench + 1] = { "TESTSET/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
end, {
} }
ubench[#ubench + 1] = { "TESTSET/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
end, {
} }
ubench[#ubench + 1] = { "TESTSET/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
end, {
} }
ubench[#ubench + 1] = { "TESTSET/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
end, {
} }
ubench[#ubench + 1] = { "TESTSET/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
end, {
} }
ubench[#ubench + 1] = { "TESTSET/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
out = b1 or n1
end, {
} }
ubench[#ubench + 1] = { "CALL_C/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_C/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_C/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_C/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_C/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_C/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_C/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_C/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
out = fc(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_T/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_T/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_T/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_T/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_T/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_T/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_T/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_T/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
out = ft(n1, n2)
end, {
["CALL_I"] = 1;
} }
ubench[#ubench + 1] = { "CALL_I/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
end, {
["GETUPVAL"] = 1;
["MOVE"] = 5;
} }
ubench[#ubench + 1] = { "CALL_I/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
end, {
["GETUPVAL"] = 1;
["MOVE"] = 5;
} }
ubench[#ubench + 1] = { "CALL_I/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
end, {
["GETUPVAL"] = 1;
["MOVE"] = 5;
} }
ubench[#ubench + 1] = { "CALL_I/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
end, {
["GETUPVAL"] = 1;
["MOVE"] = 5;
} }
ubench[#ubench + 1] = { "CALL_I/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
end, {
["GETUPVAL"] = 1;
["MOVE"] = 5;
} }
ubench[#ubench + 1] = { "CALL_I/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
end, {
["GETUPVAL"] = 1;
["MOVE"] = 5;
} }
ubench[#ubench + 1] = { "CALL_I/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
end, {
["GETUPVAL"] = 1;
["MOVE"] = 5;
} }
ubench[#ubench + 1] = { "CALL_I/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
out = fi(n1, n2)
end, {
["GETUPVAL"] = 1;
["MOVE"] = 5;
} }
ubench[#ubench + 1] = { "CLOSURE/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = function () end
out = function () end
out = function () end
out = function () end
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "CLOSURE/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "CLOSURE/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "CLOSURE/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "CLOSURE/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "CLOSURE/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "CLOSURE/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "CLOSURE/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
out = function () end
end, {
["MOVE"] = 1;
} }
ubench[#ubench + 1] = { "VARARG/4", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ...
out = ...
out = ...
out = ...
end, {
} }
ubench[#ubench + 1] = { "VARARG/8", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
end, {
} }
ubench[#ubench + 1] = { "VARARG/12", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
end, {
} }
ubench[#ubench + 1] = { "VARARG/16", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
end, {
} }
ubench[#ubench + 1] = { "VARARG/20", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
end, {
} }
ubench[#ubench + 1] = { "VARARG/24", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
end, {
} }
ubench[#ubench + 1] = { "VARARG/28", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
end, {
} }
ubench[#ubench + 1] = { "VARARG/32", function (...)
local out
local b0, b1 = false, true
local n1, n2 = 1, 2
local s1, s2 = "foo", "bar"
local t = ut
local fc, ft, fi = call, tailcall, inline
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
out = ...
end, {
} }
return ubench
