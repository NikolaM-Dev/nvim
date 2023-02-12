return {
	'jose-elias-alvarez/null-ls.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	keys = { { '<leader>cN', '<cmd>NullLsInfo<cr>', desc = 'Null-LS Info' } },
	config = function()
		local nls = require('null-ls')

		local ca = nls.builtins.code_actions
		local d = nls.builtins.diagnostics
		local f = nls.builtins.formatting

		nls.setup({
			sources = {
				f.prettier.with({
					extra_args = { '--single-quote', '--trailing-comma', 'all' },
					extra_filetypes = { 'toml' },
				}),
				d.eslint_d.with({
					-- only enable eslint if root has .eslintrc.js
					condition = function(utils)
						return utils.root_has_file('.eslintrc.js') -- change file extension if you use something else
					end,
				}),
				ca.eslint_d,
				d.staticcheck,
				f.eslint_d,
				f.gofumpt,
				f.goimports,
				f.stylua,
			},
		})
	end,
}
