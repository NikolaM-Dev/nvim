return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'typescript' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'prettierd', 'typescript-language-server' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.ts_ls = {}
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = function(_, opts)
			opts.formatters_by_ft.typescript = { 'prettierd' }
		end,
	},
}
