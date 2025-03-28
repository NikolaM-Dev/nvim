---@class NLogger
---@field private title string
local NLogger = {}

---@param title string
function NLogger:new(title)
	local logger = { title = title .. ' ' }
	self.__index = self

	return setmetatable(logger, self)
end

---@private
---@param level number
---@param msg string
function NLogger:notify(level, msg)
	---@diagnostic disable-next-line: missing-fields
	vim.notify(msg, level, { title = self.title })
end

---@param msg string
function NLogger:info(msg)
	self:notify(vim.log.levels.INFO, msg)
end

---@param msg string
function NLogger:warn(msg)
	self:notify(vim.log.levels.WARN, msg)
end

---@param msg string
function NLogger:debug(msg)
	self:notify(vim.log.levels.DEBUG, msg)
end

---@param msg string
function NLogger:error(msg)
	self:notify(vim.log.levels.ERROR, msg)
end

return NLogger
