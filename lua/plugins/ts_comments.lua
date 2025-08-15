---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'folke/ts-comments.nvim',
	desc = 'Tiny plugin to enhance Neovim\'s native comments',
	enabled = true,

	event = 'VeryLazy',
	config = true,
}
