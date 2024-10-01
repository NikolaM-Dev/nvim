---@class Table
local Table = {}

function Table:new()
	local table = {}
	self.__index = self

	return setmetatable(table, self)
end

return Table:new()
