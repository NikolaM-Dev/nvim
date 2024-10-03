local Table = require('lib.table')

---@class Filetype
local Filetype = {}

function Filetype:new()
	local filetype = {}
	self.__index = self

	return setmetatable(filetype, self)
end
return Filetype:new()
