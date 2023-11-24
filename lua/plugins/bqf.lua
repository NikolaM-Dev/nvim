return {
	'kevinhwang91/nvim-bqf',
	event = 'VeryLazy',
	keys = {
		{ '<leader>;q', '<cmd>copen<cr>', desc = 'Open [Q]uickfix' },
	},
	config = function()
		---@diagnostic disable: missing-fields
		require('bqf').setup({
			func_map = {
				filter = ';c', -- choose
				filterr = ';r', -- remove
				fzffilter = ';f', -- find
				pscrolldown = '<C-d>',
				pscrollup = '<C-u>',
				ptoggleitem = '',
			},
			preview = { winblend = 0 },
		})
	end,
}
