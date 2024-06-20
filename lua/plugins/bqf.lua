return {
	'kevinhwang91/nvim-bqf',
	event = 'VeryLazy',
	dependencies = {
		{
			'junegunn/fzf',
			build = function()
				vim.fn['fzf#install']()
			end,
		},
	},
	keys = {
		{ '<leader>;q', '<cmd>copen<cr>', desc = 'Open [Q]uickfix' },
		{ '<leader>qj', '<C-w>jj', desc = 'Next Item in [Q]uickfix' },
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
