---@class nkl.lib.opt
local M = {}

--- Set buffer-local indentation options for the current buffer.
--- Configures `shiftwidth`, `softtabstop`, and `tabstop`, and toggles `expandtab`.
---@param size number Number of spaces/tabs to use for indentation.
---@param type 'spaces' | 'tabs' If 'spaces', enable `expandtab`; if 'tabs', disable it.
function M.indent(size, type)
	vim.opt_local.shiftwidth = size
	vim.opt_local.softtabstop = size
	vim.opt_local.tabstop = size
	vim.opt_local.expandtab = type == 'spaces'
end

return M
