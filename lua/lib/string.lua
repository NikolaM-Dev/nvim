---@class NString
---@field trim fun(payload: string): string
---@field is_empty fun(payload: string | nil): boolean
local NString = {}

---@param payload string
function NString.trim(payload)
	return payload:match('^%s*(.-)%s*$')
end

---@param payload string | nil
function NString.is_empty(payload)
	return payload == nil or payload == ''
end

return NString
