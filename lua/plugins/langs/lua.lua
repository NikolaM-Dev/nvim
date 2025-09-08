return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'lua', 'luadoc', 'query' })
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
			opts.servers.lua_ls = {}
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = function(_, opts)
			opts.formatters_by_ft.lua = { 'stylua' }
		end,
	},
	{
		-- TODO: Review
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
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
