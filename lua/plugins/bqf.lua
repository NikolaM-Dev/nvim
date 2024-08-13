---@type LazySpec
return {
	'kevinhwang91/nvim-bqf',
	enabled = true,

	ft = 'qf',

	keys = {
		{ '<leader>;q', '<cmd>copen<cr>', desc = 'Open [Q]uickfix' },
		{ '<leader>qj', '<C-w>jj', desc = 'Next Item in [Q]uickfix' },
	},

	---@type BqfConfig
	opts = {
		func_map = {
			filter = ';c', -- choose
			filterr = ';r', -- remove
			fzffilter = ';f', -- find
			pscrolldown = '<C-d>',
			pscrollup = '<C-u>',
			ptoggleitem = '',
		},

		---@diagnostic disable-next-line: missing-fields
		preview = { winblend = 0 },
	},
}
