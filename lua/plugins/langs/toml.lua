---@module 'lazy.types'
---@type LazySpec
return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'toml' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'taplo' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.taplo = {}
		end,
	},
}
