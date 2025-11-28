---@module 'nkl.lib'
---@class nkl.lib
---@field apply nkl.lib.apply
---@field key nkl.lib.key
---@field logger nkl.lib.logger
---@field second_brain nkl.lib.second_brain
---@field sort nkl.lib.sort
---@field string nkl.lib.string
---@field ui nkl.lib.ui
local M = {}

local path = (...):gsub('%.init$', '')

---Setup all the modules in `lua/lib`
local function setup()
	local files = vim.fn.globpath(vim.fn.stdpath('config') .. '/lua/' .. path, '*.lua', false, true)

	for _, file in ipairs(files) do
		local mod = file:match('([^/]+)%.lua$')
		if mod ~= 'init' then
			M[mod] = require(path .. '.' .. mod)
		end
	end
end

setup()

---Create an autogroup with nikola prefix
---@param name string The name of the autogroup
function M.augroup(name)
	return vim.api.nvim_create_augroup('nikola_' .. name, { clear = true })
end

return M
