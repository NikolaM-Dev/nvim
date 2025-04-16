---@module 'lazy'
---@type LazySpec
return {
	'folke/tokyonight.nvim',
	desc = 'Folke\'s colorscheme',
	enabled = false,

	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		styles = {
			sidebars = 'transparent',
			floats = 'transparent',
		},
	},
	config = function(_, opts)
		require('tokyonight').setup(opts)

		vim.cmd.colorscheme('tokyonight')
	end,
}
