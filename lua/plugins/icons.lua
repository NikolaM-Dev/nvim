return {
	'nvim-tree/nvim-web-devicons',
	config = function()
		local icons = require('nvim-web-devicons')

		icons.setup()

		icons.set_default_icon('󰈙', '#42a5f5')
	end,
}
