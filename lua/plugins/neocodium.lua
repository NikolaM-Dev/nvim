return {
	'monkoose/neocodeium',
	desc = 'free AI completion plugin for neovim',
	enabled = true,

	event = 'VeryLazy',

	opts = {
		show_label = false,
	},

	keys = {
		-- stylua: ignore start
		{ '<M-f>', function() require('neocodeium').accept() end, mode = 'i' },
		-- stylua: ignore end
	},
}
