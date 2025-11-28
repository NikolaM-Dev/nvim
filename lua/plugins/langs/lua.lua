---@module 'lazy.types'
---@type LazySpec
return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'comment', 'lua', 'luadoc', 'query' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'lua-language-server', 'stylua' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.lua_ls = {
				settings = {
					Lua = {
						diagnostics = { unusedLocalExclude = { '_*' } },
						hint = { enable = true },
						telemetry = { enable = false },
					},
				},
			}
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = function(_, opts)
			opts.formatters_by_ft.lua = { 'stylua' }
		end,
	},

	{
		'folke/lazydev.nvim',
		desc = 'Faster LuaLS setup for Neovim',
		enabled = true,

		cmd = 'LazyDev',
		ft = 'lua',

		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
				{ path = 'snacks.nvim', words = { 'Snacks' } },
			},
		},
	},
	-- TODO: Review this
	-- {
	-- 	'saghen/blink.cmp',
	-- 	opts = {
	-- 		providers = {
	-- 			lazydev = {
	-- 				name = 'LazyDev',
	-- 				module = 'lazydev.integrations.blink',
	-- 				fallbacks = { 'lsp' },
	-- 			},
	-- 		},
	-- 	},
	-- },
}
