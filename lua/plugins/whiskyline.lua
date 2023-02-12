return {
	'glepnir/whiskyline.nvim',
	event = 'VimEnter',
	config = function()
		require('whiskyline').setup()
	end,
}
