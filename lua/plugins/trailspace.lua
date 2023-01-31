return {
	'echasnovski/mini.trailspace',
	event = 'VeryLazy',
	config = function()
		require('mini.trailspace').setup()

		local c = require('tokyonight.colors').setup()
		vim.api.nvim_command('highlight! MiniTrailspace guibg=' .. c.bg .. 'guifg=' .. c.terminal_black)
	end,
}
