local augroup = require('lib').augroup

local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
	desc = 'Highlight yank',
	group = augroup('highlight_yank'),
	callback = function()
		vim.hl.on_yank({ timeout = 200 })
	end,
})

autocmd({ 'BufWritePre' }, {
	command = [[%s/\s\+$//e]],
	desc = 'Remove trailing whitespace',
	group = augroup('remove_trailing_whitespace'),
	pattern = '*',
})
