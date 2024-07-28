---@type LazySpec
return {
	'nvim-telescope/telescope-fzy-native.nvim',
	enabled = true,

	config = function()
		require('telescope').load_extension('fzy_native')
	end,
}
