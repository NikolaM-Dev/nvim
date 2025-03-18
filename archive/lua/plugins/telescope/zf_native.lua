---@type LazySpec
return {
	'natecraddock/telescope-zf-native.nvim',
	enabled = false,

	config = function()
		require('telescope').load_extension('zf-native')
	end,
}
