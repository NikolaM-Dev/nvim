---@module 'lazy.types'
---@type LazySpec
return {
	'maxmx03/solarized.nvim',
	description = 'Solarized port for Neovim',
	enabled = false,

	lazy = false,
	priority = 1000,

	---@type solarized.config
	opts = {
		transparent = {
			enabled = false,
		},
		variant = 'spring',
		styles = {
			enabled = true,
			functions = { bold = true },
			comments = { italic = true },
		},
	},

	config = function(_, opts)
		require('solarized').setup(opts)

		vim.cmd.colorscheme('solarized')
	end,
}
