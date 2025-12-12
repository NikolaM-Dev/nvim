---@module 'lazy.types'
---@type LazySpec
return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'python' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'basedpyright', 'debugpy', 'ruff' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.basedpyright = {}
			opts.servers.ruff = {}
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = function(_, opts)
			opts.formatters_by_ft.python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' }
		end,
	},
	{
		'mfussenegger/nvim-dap-python',
		desc = 'An extension for nvim-dap, providing default configurations for python and methods to debug individual test methods or classes.',
		enabled = true,

		config = function()
			require('dap-python').setup('debugpy-adapter')
		end,
	},
}
