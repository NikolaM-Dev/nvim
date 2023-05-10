return {
	'echasnovski/mini.trailspace',
	event = 'VeryLazy',
	config = function()
		require('mini.trailspace').setup()

		vim.api.nvim_command('highlight! MiniTrailspace guibg=NONE guifg=#45475a')
	end,
}
