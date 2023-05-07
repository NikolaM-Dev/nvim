return {
	'jose-elias-alvarez/null-ls.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	keys = { { '<leader>cn', '<cmd>NullLsInfo<cr>', desc = '[N]ull-LS Info' } },
	config = function()
		local nls = require('null-ls')

		local ca = nls.builtins.code_actions
		local d = nls.builtins.diagnostics
		local f = nls.builtins.formatting

		nls.setup({
			sources = {
				d.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file({ '.eslintrc.cjs', '.eslintrc.js' })
					end,
				}),
				ca.eslint_d,
				d.staticcheck,
				f.eslint_d,
				f.gofumpt,
				f.goimports,
				f.prettierd,
				f.stylua,
				f.taplo,
			},
		})
	end,
}
