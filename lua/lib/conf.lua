---@class nkl.lib.conf
local M = {}

---Create an autogroup with nikola prefix
---@param name string The name of the autogroup
function M.augroup(name)
	return vim.api.nvim_create_augroup('nikola_' .. name, { clear = true })
end

return M
