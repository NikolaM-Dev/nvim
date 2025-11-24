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
		'stevearc/conform.nvim',
		opts = function(_, opts)
			opts.formatters_by_ft.markdown = { 'prettier' }
		end,
	},
}
