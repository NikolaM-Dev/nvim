local status, null_ls = pcall(require, 'null-ls')
if not status then
	return
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier.with({
			extra_args = { '--single-quote', '--trailing-comma', 'all' },
			extra_filetypes = { 'toml' },
		}),
		null_ls.builtins.code_actions.eslint,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.formatting.eslint,
		null_ls.builtins.formatting.stylua,
	},
	on_attach = function(client, bufnr)
		if client.supports_method('textDocument/formatting') then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
