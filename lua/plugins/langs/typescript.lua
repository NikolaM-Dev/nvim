return {
	'neovim/nvim-lspconfig',
	dependencies = 'jose-elias-alvarez/typescript.nvim',
	opts = {
		servers = {
			tsserver = {
				init_options = { preferences = { importModuleSpecifierPreference = 'relative' } },
			},
		},
		setup = {
			tsserver = function(_, opts)
				require('plugins.lsp.config').on_attach(function(client, buffer)
					if client.name == 'tsserver' then
						vim.keymap.set(
							'n',
							'<leader>oi',
							'<cmd>TypescriptOrganizeImports<cr>',
							{ buffer = buffer, desc = 'Organize Imports' }
						)
						vim.keymap.set(
							'n',
							'<leader>rf',
							'<cmd>TypescriptRenameFile<cr>',
							{ buffer = buffer, desc = 'Rename File' }
						)
						vim.keymap.set(
							'n',
							'<leader>ru',
							'<cmd>TypescriptRemoveUnused<cr>',
							{ buffer = buffer, desc = 'Rename Unused' }
						)
						vim.keymap.set(
							'n',
							'<leader>am',
							'<cmd>TypescriptAddMissingImports<cr>',
							{ buffer = buffer, desc = 'Add Missing Imports' }
						)
						vim.keymap.set(
							'n',
							'<leader>gD',
							'<cmd>TypescriptGoToSourceDefinition<cr>',
							{ buffer = buffer, desc = 'Go To Source Definition' }
						)
					end
				end)

				require('typescript').setup({ server = opts })

				return true
			end,
		},
	},
}
