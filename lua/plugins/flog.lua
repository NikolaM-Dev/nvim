return {
	'rbong/vim-flog',
	cmd = { 'Flog', 'Flogsplit', 'Floggit' },
	dependencies = 'tpope/vim-fugitive',
	keys = {
		{ '<leader>gg', '<cmd>Flog -all<cr>', desc = 'Show [G]it [Graph]' },
	},
	init = function()
		vim.g.flog_permanent_default_opts = { date = 'format:%Y-%m-%d %H:%m' }
		vim.g.flog_use_internal_lua = 1
	end,
}
