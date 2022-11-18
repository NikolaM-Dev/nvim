local status_ok, better_escape = pcall(require, 'better_escape')
if not status_ok then
	return
end

better_escape.setup({
	mapping = { 'ii' },
	timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
	clear_empty_lines = false, -- clear line after escaping if there is only whitespace
	keys = function()
		return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
	end,
})
