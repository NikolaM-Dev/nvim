return {
	'glepnir/whiskyline.nvim',
	event = 'VeryLazy',
	config = function()
		require('whiskyline').setup()
	end,
}
