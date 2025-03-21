---@class NTable
local NTable = {}

-- TODO: Add docs
---@param table table
---@param element any
function NTable.includes(table, element)
	for _, value in ipairs(table) do
		if value == element then
			return true
		end
	end

	return false
end

return NTable
