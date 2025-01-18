---@type LazySpec
return {
	'nvim-telescope/telescope-fzf-native.nvim',
	enabled = true,
	build = 'make',

	config = function()
		require('telescope').load_extension('fzf')
	end,
}
