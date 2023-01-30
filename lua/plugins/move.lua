return {
	'echasnovski/mini.move',
	event = 'VeryLazy',
	config = function()
		require('mini.move').setup({
			mappings = {
				down = '<M-J>',
				left = '<M-H>',
				line_down = '<M-J>',
				line_left = '<M-H>',
				line_right = '<M-L>',
				line_up = '<M-K>',
				right = '<M-L>',
				up = '<M-K>',
			},
		})
	end,
}
