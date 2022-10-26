local status, null_ls = pcall(require, 'null-ls')
if not status then
	return
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettierd.with({
			extra_args = { '--single-quote', '--trailing-comma', 'all' },
			extra_filetypes = { 'toml' },
		}),
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.yamllint,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.stylua,
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
