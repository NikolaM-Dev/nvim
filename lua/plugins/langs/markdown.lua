---@module 'lazy.types'
---@type LazySpec
return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'markdown', 'markdown_inline' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'marksman', 'prettier' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			-- opts.servers.marksman = {}
		end,
	},
	{
		'nvimdev/guard.nvim',
		desc = 'Lightweight, fast and async formatting and linting plugin for Neovim',
		lazy = false,

		config = function()
			local ft = require('guard.filetype')
			ft('markdown'):fmt({
				cmd = cmd,
				args = { '--stdin-filepath' },
				fname = true,
				stdin = true,
			})
		end,
	},
	{
		'Gelio/cmp-natdat',
		desc = 'nvim-cmp source to autocomplete natural dates and turm them into ISO dates',
		enabled = true,
		config = true,
	},

	{
		'saghen/blink.cmp',

		---@module 'blink-cmp'
		---@type blink.cmp.Config
		opts = {
			sources = {
				per_filetype = {
					markdown = { inherit_defaults = true, 'natdat' },
					text = { inherit_defaults = true, 'natdat' },
				},
				providers = {
					emmet = { name = 'natdat', module = 'blink.compat.source' },
				},
			},
		},
	},
}
