return {
	'folke/zen-mode.nvim',
	enabled = true,

	keys = {
		{ '<leader>zm', '<cmd>ZenMode<cr>', desc = 'Toggle [Z]en [M]ode' },
	},
	config = function()
		require('zen-mode').setup({
			window = {
				height = 1,
				width = 110,
				options = {
					cursorcolumn = false,
					cursorline = true,
					foldcolumn = '0',
					list = true,
					number = true,
					relativenumber = true,
					signcolumn = 'yes',
					colorcolumn = '80',
				},
			},
			plugins = {
				gitsigns = { enabled = false },
				options = { enabled = false, laststatus = 3, ruler = true, showcmd = true },
				tmux = { enabled = false },
				twilight = { enabled = false },
			},
		})
	end,
}
