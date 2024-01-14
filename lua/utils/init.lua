local M = {}

-- TODO: Add type
function M.go_to_window(window)
	local nrs = {}
	local ids = {}

	---@type table<integer>
	local windows = vim.tbl_filter(function(id)
		return vim.api.nvim_win_get_config(id).relative == ''
	end, vim.api.nvim_tabpage_list_wins(0))

	for _, win in ipairs(windows) do
		local number = vim.api.nvim_win_get_number(win)

		table.insert(nrs, number)
		ids[number] = win
	end

	if ids[window] then
		vim.api.nvim_set_current_win(ids[window])
	elseif window == 4 then
		vim.cmd('G commit')
	end
end

return M
