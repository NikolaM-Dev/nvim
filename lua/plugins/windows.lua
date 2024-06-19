return {
	'anuvyklack/windows.nvim',
	enabled = true,

	event = 'VeryLazy',
	dependencies = 'anuvyklack/middleclass',
	config = function()
		require('windows').setup()
	end,
}
