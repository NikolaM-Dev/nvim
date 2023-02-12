return {
	{
		'neovim/nvim-lspconfig',
		event = 'BufReadPre',
		dependencies = {
			{ 'folke/neoconf.nvim', cmd = 'Neoconf', config = true },
			{ 'folke/neodev.nvim', opts = { experimental = { pathStrict = true } } },
			'williamboman/mason-lspconfig.nvim',
		},
		---@class PluginLspOpts
		opts = {
			-- LSP Server Settings
			---@type lspconfig.options
			servers = {
				cssls = {},
				gopls = {},
				html = {},
				jsonls = {},
				lua_ls = { settings = { Lua = { telemetry = { enable = false } } } },
				tailwindcss = {},
				vimls = {},
			},
			capabilities = {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don't want this server to be setup with lspconfig
			---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
			setup = {
				-- example to setup with typescript.nvim
				-- tsserver = function(_, opts)
				--   require("typescript").setup({ server = opts })
				--   return true
				-- end,
				-- Specify * to use this function as a fallback for any server
				-- ["*"] = function(server, opts) end,
			},
		},
		---@param opts PluginLspOpts
		config = function(_, opts)
			local config = require('plugins.lsp.config')

			config.servers = opts.servers
			config.setup = opts.setup

			config.on_attach(function(client, buffer)
				require('plugins.lsp.format').on_attach(client, buffer)
				require('plugins.lsp.keymaps').on_attach(client, buffer)
			end)

			config.signs()
			config.lsp_handlers()
			config.diagnostics()
			config.setup_servers()
		end,
	},
}
