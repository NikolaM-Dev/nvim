return {
	'jose-elias-alvarez/null-ls.nvim',
	event = 'BufReadPre',
	keys = { { '<leader>cN', '<cmd>NullLsInfo<cr>', desc = 'Null-LS Info' } },
	config = function()
		local nls = require('null-ls')
		local augroup = vim.api.nvim_create_augroup('LspFormatting', { clear = true })

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
				-- typescript_code_actions,
			},
			on_attach = function(current_client, bufnr)
				if current_client.supports_method('textDocument/formatting') then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd('BufWritePre', {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									-- go tmpl
									if client.name == 'html' or client.name == 'emmet_ls' then
										return true
									end

									--  only use null-ls for formatting instead of lsp server
									return client.name == 'null-ls'
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
