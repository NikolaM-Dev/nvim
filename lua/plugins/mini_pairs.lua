---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'echasnovski/mini.pairs',
	desc = 'Neovim Lua plugin to automatically manage character pairs',
	enabled = true,

	event = 'InsertEnter',
	config = function()
		require('mini.pairs').setup()
	end,
}
