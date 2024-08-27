---@class Logger
---@field private title string
local Logger = {}

---@param title string
function Logger:new(title)
	local logger = { title = title .. ' |' }
	self.__index = self

	return setmetatable(logger, self)
end

---@private
---@param level number
---@param msg string
function Logger:notify(level, msg)
	---@diagnostic disable-next-line: missing-fields
	vim.notify(msg, level, { title = self.title })
end
return Logger
