---@class nkl.lib.tmux
local M = {}

function M.is_running()
	local res = vim.system({ 'n-tmux-is-running' }, { text = true }):wait()
	return res.code == 0
end

return M
