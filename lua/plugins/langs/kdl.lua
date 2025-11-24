---@module 'lazy.types'
---@type LazySpec
return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'kdl' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'kdlfmt' })
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = function(_, opts)
			opts.formatters_by_ft.kdl = { 'kdlfmt' }
		end,
	},
}
