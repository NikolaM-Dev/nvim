---@type LazySpec
return {
	'echasnovski/mini.indentscope',
	enabled = true,

	event = 'VeryLazy',

	---@type table
	opts = {
		options = {
			try_as_border = true,
		},
		symbol = '│',
	},

	---@param opts? table
	config = function(_, opts)
		opts.draw = { animation = require('mini.indentscope').gen_animation.none() }

		require('mini.indentscope').setup(opts)
	end,
}
