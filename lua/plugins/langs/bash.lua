return {
	{
		'nvim-treesitter/nvim-treesitter',
		ft = { 'bash', 'sh', 'zsh' },
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'bash' })
		end,
	},
	{
		'williamboman/mason.nvim',
		ft = { 'bash', 'sh', 'zsh' },
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'bash-language-server', 'shfmt' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		ft = { 'bash', 'sh', 'zsh' },
		opts = function(_, opts)
			opts.servers.bashls = {
				filetypes = { 'bash', 'sh', 'zsh' },
			}
		end,
	},
	{
		'stevearc/conform.nvim',
		ft = { 'bash', 'sh', 'zsh' },
		opts = function(_, opts)
			opts.formatters_by_ft.bash = { 'shfmt' }
			opts.formatters_by_ft.sh = { 'shfmt' }
			opts.formatters_by_ft.zsh = { 'shfmt' }
		end,
	},
}
