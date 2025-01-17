---@type LazySpec
return {
	'nvim-telescope/telescope-fzy-native.nvim',
	enabled = false,

	config = function()
		require('telescope').load_extension('fzy_native')
	end,
}
