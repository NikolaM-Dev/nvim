---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'nvim-mini/mini.pairs',
	desc = 'Neovim Lua plugin to automatically manage character pairs',
	enabled = true,

	event = 'InsertEnter',
	config = function()
		require('mini.pairs').setup()
	end,
}
