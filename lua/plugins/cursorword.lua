return {
	'echasnovski/mini.cursorword',
	enabled = true,
	event = 'VeryLazy',
	config = function()
		require('mini.cursorword').setup()

		vim.api.nvim_set_hl(0, 'MiniCursorword', { bg = '#313244' })
		vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', { bg = '#313244' })
	end,
}
