---@type LazySpec
return {
	'echasnovski/mini-git',
	enabled = true,

	cmd = 'Git',

	keys = {
		{ '<leader>gcm', '<cmd>Git commit -v<cr>', desc = '[G]it [C]o[M]it' },
	},

	---@type table
	opts = {},

	---@param opts? table
	config = function(_, opts)
		require('mini.git').setup(opts)
	end,
}
