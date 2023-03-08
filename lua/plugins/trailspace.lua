return {
	'echasnovski/mini.trailspace',
	event = 'VeryLazy',
	config = function()
		require('mini.trailspace').setup()

		local c = require('catppuccin.palettes').get_palette('mocha')
		vim.api.nvim_command('highlight! MiniTrailspace guibg=' .. c.base .. 'guifg=' .. c.red)
	end,
}
