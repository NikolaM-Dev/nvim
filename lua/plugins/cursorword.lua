return {
	'echasnovski/mini.cursorword',
	event = { 'BufNewFile', 'BufRead', 'BufAdd' },
	enabled = false,
	config = function()
		require('mini.cursorword').setup()

		vim.api.nvim_command('highlight! MiniCursorwordCurrent guifg=NONE guibg=#3b4261 gui=NONE cterm=NONE')
		vim.api.nvim_command('highlight! MiniCursorword guifg=NONE guibg=#3b4261 gui=NONE cterm=NONE')
	end,
}
