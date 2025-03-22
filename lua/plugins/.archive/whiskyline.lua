return {
	'NikolaM-Dev/whiskyline.nvim',
	enabled = false,
	event = 'VimEnter',
	config = function()
		require('whiskyline').setup()
	end,
}
