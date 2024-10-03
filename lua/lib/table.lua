---@class Table
local Table = {}

function Table:new()
	local table = {}
	self.__index = self

	return setmetatable(table, self)
end

-- TODO: Add docs
---@param table table
---@param element any
function Table:includes(table, element)
	for _, value in ipairs(table) do
		if value == element then
			return true
		end
	end

	return false
end

return Table:new()
