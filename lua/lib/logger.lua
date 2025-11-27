---@class nkl.lib.logger
---@field private title string
local M = {}

---@param title string
function M:new(title)
	local logger = { title = title .. ' ' }
	self.__index = self

	return setmetatable(logger, self)
end

---@private
---@param level number
---@param msg string
function M:notify(level, msg)
	vim.notify(msg, level, { title = self.title })
end

---@param msg string
function M:info(msg)
	self:notify(vim.log.levels.INFO, msg)
end

---@param msg string
function M:warn(msg)
	self:notify(vim.log.levels.WARN, msg)
end

---@param msg string
function M:debug(msg)
	self:notify(vim.log.levels.DEBUG, msg)
end

---@param msg string
function M:error(msg)
	self:notify(vim.log.levels.ERROR, msg)
end

return M
