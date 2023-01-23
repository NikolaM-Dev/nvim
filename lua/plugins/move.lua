return {
	'echasnovski/mini.move',
	event = 'VeryLazy',
	opts = {
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
	},
	config = function(_, opts)
		require('mini.move').setup(opts)
	end,
}
