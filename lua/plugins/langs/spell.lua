return {
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'harper-ls' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.harper_ls = {
				settings = {
					['harper-ls'] = {
						markdown = {
							IgnoreLinkTitle = true,
						},
					},
				},
			}

			vim.keymap.set('n', 'zg', function()
				vim.lsp.buf.code_action({
					apply = true,
					filter = function(a)
						return a.title:find('^Add .* to the user dictionary%.') ~= nil
					end,
				})
			end, { desc = 'Add word to harper dictionary' })
		end,
	},
}
