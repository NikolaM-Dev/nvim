return {
	{
		'nvim-treesitter/nvim-treesitter',
		ft = 'lua',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'lua', 'luadoc', 'query' })
		end,
	},
	{
		'williamboman/mason.nvim',
		ft = 'lua',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'lua-language-server', 'stylua' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		ft = 'lua',
		opts = function(_, opts)
			opts.servers.lua_ls = {}
		end,
	},
	{
		'stevearc/conform.nvim',
		ft = 'lua',
		opts = function(_, opts)
			opts.formatters_by_ft.lua = { 'stylua' }
		end,
	},
}
