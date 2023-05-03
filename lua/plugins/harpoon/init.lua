return {
	'ThePrimeagen/harpoon',
	keys = require('plugins.harpoon.keys').keys,
	config = function()
		require('harpoon').setup()
	end,
}
