---@module 'lazy.types'
---@type LazySpec
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
