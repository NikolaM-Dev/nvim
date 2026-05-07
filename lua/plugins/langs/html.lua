---@module 'lazy.types'
---@type LazySpec
return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'html' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'prettier', 'html-lsp' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.html = {}
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = function(_, opts)
			opts.formatters_by_ft.html = { 'prettier' }
		end,
	},

	{
		'NikolaM-Dev/cmp-emmet_nvim',
		dir = '~/w/1-projects/nvim/cmp-emmet_nvim',
		desc = 'nvim-cmp source for emmet',

		build = 'npm run release',
		ft = { 'html', 'css' },
	},
	{
		'saghen/blink.cmp',

		---@module 'blink-cmp'
		---@type blink.cmp.Config
		opts = {
			sources = {
				per_filetype = {
					css = { inherit_defaults = true, 'emmet' },
					html = { inherit_defaults = true, 'emmet' },
				},
				providers = {
					emmet = { name = 'emmet', module = 'blink.compat.source' },
				},
			},
		},
	},
}
