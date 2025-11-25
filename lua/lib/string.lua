---@class nkl.lib.string
local M = {}

---Trim whitespace from both ends of a string.
---@param payload? string
---@return string
function M.trim(payload)
	if payload == nil then
		return ''
	end

	return payload:match('^%s*(.-)%s*$')
end

---Check whether a value is nil, empty, or only whitespace.
---@param payload? string
---@return boolean
function M.is_empty(payload)
	if payload == nil then
		return true
	end

	-- if there is any non-space character, then it's not blank
	return payload:match('%S') == nil
end
return M
