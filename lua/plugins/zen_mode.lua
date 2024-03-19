return {
	'folke/zen-mode.nvim',
	enabled = true,
	keys = {
		{ '<leader>zm', '<cmd>ZenMode<cr>', desc = 'Toggle [Z]en [M]ode' },
	},
	config = function()
		require('zen-mode').setup({
			window = {
				backdrop = 0.95,
				height = 1,
				options = { colorcolumn = '', signcolumn = 'no' },
				width = 80,
			},
			plugins = {
				alacritty = { enabled = true, font = '13' },
				gitsigns = { enabled = false },
				options = { enabled = true, laststatus = 0, ruler = false, showcmd = false },
				tmux = { enabled = true },
				twilight = { enabled = false },
			},
		})
	end,
}
