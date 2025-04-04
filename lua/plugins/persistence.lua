---@module 'lazy'
---@type LazySpec
return {
	'folke/persistence.nvim',
	desc = 'Simple session management for Neovim',
	enabled = true,

	event = 'BufReadPre',
	config = true,
}
