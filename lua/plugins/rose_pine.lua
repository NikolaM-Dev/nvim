---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'rose-pine/neovim',
	desc = 'Soho vibes for Neovim',
	enabled = false,

	lazy = false,
	priority = 1000,
	name = 'rose-pine',

	---@type table
	opts = {
		highlight_groups = {
			['@markup.italic'] = { fg = 'subtle' },
			['@markup.strong'] = { fg = 'iris' },
		},

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
