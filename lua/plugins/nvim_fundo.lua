---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'kevinhwang91/nvim-fundo',
	desc = 'Forever undo in Neovim',
	enabled = true,

	event = 'BufReadPost',

	build = function()
		require('fundo').install()
	end,

	config = true,
}
