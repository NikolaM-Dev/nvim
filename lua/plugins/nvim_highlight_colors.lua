---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'brenoprata10/nvim-highlight-colors',
	desc = 'Highlight colors for neovim',
	enabled = true,

	event = 'BufReadPre',

	---@type table
	opts = {
		enable_tailwind = true,
	},
}
