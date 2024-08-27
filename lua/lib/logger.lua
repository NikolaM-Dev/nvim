---@class Logger
---@field private title string
local Logger = {}

---@param title string
function Logger:new(title)
	local logger = { title = title .. ' |' }
	self.__index = self

	return setmetatable(logger, self)
end

return Logger
