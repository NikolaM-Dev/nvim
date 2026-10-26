---@module 'lazy.types'
---@type LazySpec
return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'astro' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'astro-language-server', 'prettier' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.astro = {}
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = function(_, opts)
			opts.formatters_by_ft.astro = { 'prettier' }
		end,
	},
	{
		'windwp/nvim-ts-autotag',
		ft = { 'astro' },
	},
	{
		'saghen/blink.cmp',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			sources = {
				per_filetype = {
					astro = { inherit_defaults = true, 'emmet' },
				},
			},
		},
	},
}
