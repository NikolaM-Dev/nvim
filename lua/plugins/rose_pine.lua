---@module 'lazy'
---@type LazySpec
return {
	'rose-pine/neovim',
	desc = 'Soho vibes for Neovim',
	enabled = true,

	lazy = false,
	priority = 1000,
	name = 'rose-pine',

	---@type table
	opts = {
		styles = {
			transparency = true,
		},
	},

	---@param opts table
	config = function(_, opts)
		require('rose-pine').setup(opts)

		vim.cmd('colorscheme rose-pine-moon')
	end,
}
