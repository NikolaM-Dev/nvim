---@module 'lazy'
---@type LazySpec
return {
	'neovim/nvim-lspconfig',
	desc = 'Quickstart configs for Nvim LSP',
	enabled = true,
	event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },

	opts = {
		servers = {},
	},

	config = function(_, opts)
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
			desc = 'LSP actions',
			callback = function(args)
				---@param lhs string
				---@param rhs function
				---@param desc string
				---@param mode? string|string[]
				local function map(lhs, rhs, desc, mode)
					vim.keymap.set(mode or 'n', lhs, rhs, { buffer = args.buf, desc = desc })
				end

				map('gd', function()
					Snacks.picker.lsp_definitions()
				end, '[G]oto [D]efinition')
				map('K', vim.lsp.buf.hover, 'Hover Documentation')
				map('gr', vim.lsp.buf.references, 'References')
				map('<leader>ca', vim.lsp.buf.code_action, 'Code Action', { 'n', 'v' })
				map('gr', vim.lsp.buf.references, 'References')
				map('gI', vim.lsp.buf.implementation, 'Goto Implementation')
				map('gy', vim.lsp.buf.type_definition, 'Goto T[y]pe Definition')
				map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
				map('<leader>cR', function()
					Snacks.rename.rename_file()
				end, 'Rename File')

				map('<leader>cr', vim.lsp.buf.rename, 'Rename')
			end,
		})

		-- [LSP Configs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
		local lspconfig = require('lspconfig')
		for name, server in pairs(opts.servers) do
			if server then
				lspconfig[name].setup(server)
			end
		end
	end,
}
