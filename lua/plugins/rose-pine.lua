---@type LazySpec
return {
	'rose-pine/neovim',
	enabled = true,

	lazy = false,
	priority = 1000,
	name = 'rose-pine',

	---@type table
	opts = {
	},

	---@param opts table
	config = function(_, opts)
		require('rose-pine').setup(opts)

		vim.cmd.colorscheme('rose-pine-moon')
	end,
}
