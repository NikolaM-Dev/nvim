---@module 'lazy.types'
---@type LazySpec
return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'sql' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'sleek' })
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = function(_, opts)
			opts.formatters_by_ft.mysql = { 'sleek' }
			opts.formatters_by_ft.plsql = { 'sleek' }
			opts.formatters_by_ft.sql = { 'sleek' }
		end,
	},
	{
		'jsborjesson/vim-uppercase-sql',
		desc = 'Automatically uppercase SQL keywords as you type',
		enabled = true,
		ft = { 'mysql', 'psql', 'sql' },
	},
}
