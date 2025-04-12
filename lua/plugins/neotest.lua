---@module 'lazy'
---@type LazySpec
return {
	'nvim-neotest/neotest',
	desc = 'An extensible framework for interacting with tests within NeoVim',
	enabled = true,

	dependencies = 'nvim-neotest/nvim-nio',
	config = true,
	---@type table
	opts = {
		adapters = {},
	},

	---@param opts table
	config = function(_, opts)
		require('neotest').setup(opts)
	end,
}
