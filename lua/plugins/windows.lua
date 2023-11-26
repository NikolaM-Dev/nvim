return {
	'anuvyklack/windows.nvim',
	event = 'VeryLazy',
	dependencies = 'anuvyklack/middleclass',
	config = function()
		require('windows').setup()
	end,
}
