local autocmd = vim.api.nvim_create_autocmd

autocmd({ 'BufEnter' }, {
	desc = 'Disables autocommenting on new lines',
	group = _G.augroup('disable_autocommenting'),
	pattern = '*',
	callback = function()
		vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
	end,
})

autocmd('TextYankPost', {
	desc = 'Highlight yank',
	group = _G.augroup('highlight_yank'),
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 200,
		})
	end,
})

autocmd({ 'BufWritePre' }, {
	command = [[%s/\s\+$//e]],
	desc = 'Remove trailing whitespace',
	group = _G.augroup('remove_trailing_whitespace'),
	pattern = '*',
})

autocmd({ 'FileType' }, {
	desc = 'Open in right vertical split',
	group = _G.augroup('open_in_right_vertical_split'),
	pattern = { 'floggraph', 'gitcommit', 'help', 'man' },
	callback = function()
		vim.cmd.wincmd('L')
	end,
})

autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
	command = 'checktime',
	desc = 'Check if we need to reload the file when it changed',
	group = _G.augroup('checktime'),
})

autocmd({ 'VimResized' }, {
	desc = 'Resize splits if window got resized',
	group = _G.augroup('resize_splits'),
	callback = function()
		local current_tab = vim.fn.tabpagenr()

		vim.cmd('tabdo wincmd =')
		vim.cmd('tabnext ' .. current_tab)
	end,
})

autocmd('BufReadPost', {
	desc = 'Go to last loc when opening a buffer',
	group = _G.augroup('go_last_loc'),
	pattern = '*',
	callback = function(event)
		local exclude = { 'gitcommit' }
		local buf = event.buf

		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end

		vim.b[buf].lazyvim_last_loc = true

		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)

		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

autocmd('FileType', {
	desc = 'Focus DiffView file panel when opening a gitcommit',
	group = _G.augroup('focus_diff_file_panel'),
	pattern = { 'gitcommit' },
	callback = function(event)
		vim.bo[event.buf].buflisted = false

		vim.keymap.set('n', '<leader>e', function()
			require('utils').go_to_window(1)
		end, { buffer = event.buf, silent = true, desc = 'Go to DiffView file panel' })
	end,
})
