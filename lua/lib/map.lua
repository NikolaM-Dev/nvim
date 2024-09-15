---@class Map
local Map = {}

---@private
function Map:new()
	local map = {}
	self.__index = self

	return setmetatable(map, self)
end

local new_map = Map:new()
return new_map
