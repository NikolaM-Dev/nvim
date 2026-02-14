---@module 'lazy.types'
---@type LazySpec
return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'javascript', 'jsdoc', 'typescript' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'eslint-lsp', 'prettier', 'tsgo', 'typescript-language-server' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			-- opts.servers.tsgo = {}
			opts.servers.eslint = {}
			opts.servers.ts_ls = {}
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = function(_, opts)
			opts.formatters_by_ft.javascript = { 'prettier' }
			opts.formatters_by_ft.typescript = { 'prettier' }
		end,
	},
}
