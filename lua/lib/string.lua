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

return M
