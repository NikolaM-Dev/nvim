local status, null_ls = pcall(require, 'null-ls')
if not status then
	return
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
	sources = {
		formatting.prettier.with({
			extra_args = { '--single-quote', '--trailing-comma', 'all' },
			extra_filetypes = { 'toml' },
		}),
		null_ls.builtins.code_actions.eslint_d,
			-- only enable eslint if root has .eslintrc.js
			condition = function(utils)
				return utils.root_has_file('.eslintrc.js') -- change file extension if you use something else
			end,
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
