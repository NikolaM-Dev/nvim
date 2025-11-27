---@class nkl.lib.sort
local M = {}

---Tokenize string into number and string tokens.
---@param s string
---@return table
local function tokenize(s)
	s = tostring(s)

	local t = {}
	local i = 1
	local len = #s

	while i <= len do
		local c = s:sub(i, i)
		if c:match('%d') then
			local j = i
			while j <= len and s:sub(j, j):match('%d') do
				j = j + 1
			end
			t[#t + 1] = { type = 'num', val = tonumber(s:sub(i, j - 1)) }
			i = j
		else
			local j = i
			while j <= len and not s:sub(j, j):match('%d') do
				j = j + 1
			end
			t[#t + 1] = { type = 'str', val = s:sub(i, j - 1) }
			i = j
		end
	end

	return t
end

---Compare two names using natural ordering.
---@param a string
---@param b string
---@return boolean
function M.natural_less(a, b)
	local t1 = tokenize(a)
	local t2 = tokenize(b)
	local n = math.max(#t1, #t2)

	for i = 1, n do
		local x = t1[i]
		local y = t2[i]

		if not x then
			return true
		end

		if not y then
			return false
		end

		if x.type == y.type then
			if x.type == 'num' then
				if x.val ~= y.val then
					return x.val < y.val
				end
			else
				if x.val ~= y.val then
					return x.val < y.val
				end
			end
		else
			-- prefer numbers before letters when token types differ
			return x.type == 'num'
		end
	end

	return false
end

return M
