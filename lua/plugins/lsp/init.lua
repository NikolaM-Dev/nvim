return {
	-- lspconfig
	{
		'neovim/nvim-lspconfig',
		event = 'BufReadPre',
		dependencies = {
			'mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			{
				'hrsh7th/cmp-nvim-lsp',
				cond = function()
					require('util').has('nvim-cmp')
				end,
			},
		},
		opts = {
			signs = {
				Error = ' ',
				Warn = ' ',
				Hint = ' ',
				Info = ' ',
			},
			capabilities = {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			},
			-- Automatically format on save
			autoformat = true,
			-- options for vim.lsp.buf.format
			-- `bufnr` and `filter` is handled by the LazyVim formatter,
			-- but can be also overriden when specified
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			diagnostics = {
				virtual_text = {
					source = 'always',
					prefix = '■',
					severity = {
						min = vim.diagnostic.severity.ERROR,
					},
				},
				underline = {
					severity = {
						min = vim.diagnostic.severity.HINT,
					},
				},
				update_in_insert = false,
				severity_sort = true,
				float = {
					focusable = true,
					style = 'minimal',
					border = 'rounded',
					source = 'always',
					header = '',
					prefix = '',
				},
			},
			servers = {
				-- mason = false, -- set to false if you don't want this server to be installed with mason
				bashls = {
					filetypes = { 'sh', 'zsh' },
				},
				html = {},
				sumneko_lua = {
					settings = {
						Lua = {
							runtime = {
								version = 'LuaJIT',
							},
							workspace = {
								library = {
									[vim.fn.expand('$VIMRUNTIME/lua')] = true,
								},
								checkThirdParty = false,
								diagnostics = {
									globals = { 'vim' },
								},
							},
							completion = {
								callSnippet = 'Replace',
							},
						},
					},
				},
			},
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
		---@diagnostic disable-next-line: unused-local
		config = function(plugin, opts)
			-- setup autoformat
			require('plugins.lsp.format').autoformat = opts.autoformat
			-- setup  keymaps
			require('util').on_attach(function(client, buffer)
				require('plugins.lsp.format').on_attach(client, buffer)
				require('plugins.lsp.keymaps').on_attach(client, buffer)
			end)

			-- diagnostics
			for name, icon in pairs(opts.signs) do
				name = 'DiagnosticSign' .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = '' })
			end
			vim.diagnostic.config(opts.diagnostics)

			local servers = opts.servers
			local capabilities =
				require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local function setup(server)
				local server_opts = servers[server] or {}
				server_opts.capabilities = capabilities
				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup['*'] then
					if opts.setup['*'](server, server_opts) then
						return
					end
				end
				require('lspconfig')[server].setup(server_opts)
			end

			local mlsp = require('mason-lspconfig')
			local available = mlsp.get_available_servers()

			local ensure_installed = {}
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
					if server_opts.mason == false or not vim.tbl_contains(available, server) then
						setup(server)
					else
						ensure_installed[#ensure_installed + 1] = server
					end
				end
			end

			require('mason-lspconfig').setup({ ensure_installed = ensure_installed })
			require('mason-lspconfig').setup_handlers({ setup })
		end,
	},
}
