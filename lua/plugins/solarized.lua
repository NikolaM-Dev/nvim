---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'maxmx03/solarized.nvim',
	description = '',
	enabled = true,

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
