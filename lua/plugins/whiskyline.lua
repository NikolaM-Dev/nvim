return {
	'NikolaM-Dev/whiskyline.nvim',
	event = 'VimEnter',
	config = function()
		require('whiskyline').setup()
	end,
}
