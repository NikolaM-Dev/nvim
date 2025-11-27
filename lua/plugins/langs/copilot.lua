---@module 'lazy.types'
---@type LazySpec
return {
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'copilot-language-server' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, _opts)
			-- opts.servers.copilot = {}
		end,
	},
}
