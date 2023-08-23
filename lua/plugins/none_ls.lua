return {
	'nvimtools/none-ls.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	keys = { { '<leader>cn', '<cmd>NullLsInfo<cr>', desc = '[N]ull-LS Info' } },
	config = function()
		local nls = require('null-ls')
		local augroup = _G.augroup('lsp_formatting')

		local d = nls.builtins.diagnostics
		local f = nls.builtins.formatting

		nls.setup({
			sources = {
				d.staticcheck,
				d.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file({ '.eslintrc.cjs', '.eslintrc.js' })
					end,
				}),

				f.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file({ '.eslintrc.cjs', '.eslintrc.js' })
					end,
				}),
				f.gofumpt,
				f.goimports,
				f.prettierd.with({ extra_args = { '--single-quote', '--trailing-comma', 'all' } }),
				f.prettier.with({ extra_args = { '--single-quote', '--trailing-comma', 'all' } }),
				f.stylua,
				f.taplo,
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
								async = false,
							})
						end,
					})
				end
			end,
		})
	end,
}
