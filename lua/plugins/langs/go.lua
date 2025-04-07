return {
	{
		'nvim-treesitter/nvim-treesitter',
		ft = 'go',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'go', 'gomod', 'gosum', 'gotmpl', 'gowork' })
		end,
	},
	{
		'williamboman/mason.nvim',
		ft = 'go',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'gopls', 'gofumpt', 'goimports' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		ft = 'go',
		opts = function(_, opts)
			opts.servers.gopls = {}
		end,
	},
	{
		'stevearc/conform.nvim',
		ft = 'go',
		opts = function(_, opts)
			opts.formatters_by_ft.go = { 'goimports', 'gofumpt' }
		end,
	},
}
