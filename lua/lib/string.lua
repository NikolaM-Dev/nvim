---@class NString
---@field trim fun(payload: string): string
local NString = {}

---@param payload string
function NString.trim(payload)
	return payload:match('^%s*(.-)%s*$')
end

return NString
