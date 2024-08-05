---@type LazySpec
return {
	'kevinhwang91/nvim-bqf',
	enabled = true,

	ft = 'qf',
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
