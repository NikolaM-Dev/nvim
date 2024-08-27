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

---@param msg string
function Logger:info(msg)
	self:notify(vim.log.levels.INFO, msg)
end

---@param msg string
function Logger:warn(msg)
	self:notify(vim.log.levels.WARN, msg)
end

---@param msg string
function Logger:debug(msg)
	self:notify(vim.log.levels.DEBUG, msg)
end

---@param msg string
function Logger:error(msg)
	self:notify(vim.log.levels.ERROR, msg)
end

return Logger
