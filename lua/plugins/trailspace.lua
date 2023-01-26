local c = require('tokyonight.colors').setup()

vim.api.nvim_command('highlight! MiniTrailspace guibg=' .. c.bg .. 'guifg=' .. c.terminal_black)

return {
	'echasnovski/mini.trailspace',
	event = 'VeryLazy',
	config = function(_, opts)
		require('mini.trailspace').setup(opts)
	end,
}
