---@module 'lazy'
---@type LazySpec
return {
	'nvim-neotest/neotest',
	desc = 'An extensible framework for interacting with tests within NeoVim',
	enabled = true,

	dependencies = 'nvim-neotest/nvim-nio',
	config = true,
}
