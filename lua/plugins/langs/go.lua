return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'go', 'gomod', 'gosum', 'gotmpl', 'gowork' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'gopls', 'gofumpt', 'goimports' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.gopls = {}
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = function(_, opts)
			opts.formatters_by_ft.go = { 'goimports', 'gofumpt' }
		end,
	},
	{
		'nvim-neotest/neotest',
		dependencies = {
			{
				'fredrikaverpil/neotest-golang',
				desc = 'Reliable Neotest adapter for running Go tests in Neovim',
				version = '*',
			},
		},
		opts = function(_, opts)
			vim.list_extend(opts.adapters, { require('neotest-golang') })
		end,
	},
}
