return {
	'natecraddock/telescope-zf-native.nvim',
	enabled = true,

	config = function()
		require('telescope').load_extension('zf-native')
	end,
}
