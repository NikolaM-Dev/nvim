return {
	'neovim/nvim-lspconfig',
	opts = {
		---@type lspconfig.options
		servers = {
			eslint = {
				settings = {
					workingDirectory = { mode = 'auto' },
				},
			},
		},
		setup = {
			eslint = function()
				vim.api.nvim_create_autocmd('BufWritePre', {
					callback = function(event)
						local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = 'eslint' })[1]

						if client then
							local diag = vim.diagnostic.get(
								event.buf,
								{ namespace = vim.lsp.diagnostic.get_namespace(client.id) }
							)

							if #diag > 0 then
								vim.cmd('EslintFixAll')
							end
						end
					end,
				})
			end,
		},
	},
}
