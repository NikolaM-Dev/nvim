---@type LazySpec
return {
	'nvim-telescope/telescope-fzf-native.nvim',
	enabled = false,

	config = function()
		require('telescope').load_extension('fzf')
	end,
}
