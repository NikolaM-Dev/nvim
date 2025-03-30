return {
	{
		'nvim-treesitter/nvim-treesitter',
		ft = 'markdown',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'markdown', 'markdown_inline' })
		end,
	},
	{
		'williamboman/mason.nvim',
		ft = 'markdown',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'marksman', 'prettier' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		ft = 'markdown',
		opts = function(_, opts)
			opts.servers.marksman = {}
		end,
	},
	{
		'stevearc/conform.nvim',
		ft = 'markdown',
		opts = function(_, opts)
			opts.formatters_by_ft.markdown = { 'prettier' }
		end,
	},
}
