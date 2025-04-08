local augroup = require('lib').augroup

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight yank',
	group = augroup('highlight_yank'),
	callback = function()
		vim.hl.on_yank({ timeout = 200 })
	end,
})
