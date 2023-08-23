return {
	'nvimtools/none-ls.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	keys = { { '<leader>cn', '<cmd>NullLsInfo<cr>', desc = '[N]ull-LS Info' } },
	config = function()
		local nls = require('null-ls')

		local d = nls.builtins.diagnostics
		local f = nls.builtins.formatting

		nls.setup({
			sources = {
				d.staticcheck,

				f.prettier.with({ extra_args = { '--single-quote', '--trailing-comma', 'all' } }),
				f.prettierd.with({ extra_args = { '--single-quote', '--trailing-comma', 'all' } }),
				f.gofumpt,
				f.goimports,
				f.stylua,
				f.taplo,
			},
		})
	end,
}
