local function signs_setup()
	local signs = { Error = '󰅙', Hint = '󰌵', Info = '󰋼', Warn = '' }

	for name, icon in pairs(signs) do
		local hl = 'DiagnosticSign' .. name

		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

local function diagnostics_setup()
	---@type vim.diagnostic.Opts?
	local diagnostics = {
		float = {
			border = 'single',
			header = { '🤔 Diagnostics\n', 'Title' },
		},
		severity_sort = true,
		virtual_text = { prefix = '🔥', spacing = 2 },
	}

	vim.diagnostic.config(diagnostics)
end

local function lsp_handlers_setup()
	require('lspconfig.ui.windows').default_options.border = 'single'

	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = 'single',
	})

	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = 'single',
		focusable = false,
		relative = 'cursor',
	})
end

local function go_to_diagnostic(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil

	return function()
		go({ severity = severity })
		vim.diagnostic.open_float()
	end
end

return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'folke/neodev.nvim',
		'williamboman/mason.nvim',
	},
	config = function()
		require('neodev').setup()

		diagnostics_setup()
		lsp_handlers_setup()
		signs_setup()

		local lspconfig = require('lspconfig')

		local function on_attach(client, bufnr)
			vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

			local function nmap(keys, func, desc, mode)
				if desc then
					desc = 'LSP: ' .. desc
				end

				if mode then
					mode = mode
				else
					mode = 'n'
				end

				vim.keymap.set(mode, keys, func, {
					buffer = bufnr,
					desc = desc,
					silent = true,
				})
			end

			nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation', 'i')
			nmap('ga', vim.lsp.buf.code_action, '[C]ode [A]ction')
			nmap('gd', function()
				local hasObsidian, obsidian = pcall(require, 'obsidian')

				if not hasObsidian then
					vim.cmd('Telescope lsp_definitions')

					return
				end

				if obsidian.util.cursor_on_markdown_link() then
					return vim.cmd('ObsidianFollowLink')
				else
					vim.cmd('Telescope lsp_definitions')
				end
			end, '[G]o to [D]efinition')
			nmap(';gd', '<cmd>vsplit | lua vim.lsp.buf.definition()<cr>', '[G]o to [D]efinition in vsplit')
			nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
			nmap('gI', '<cmd>Telescope lsp_implementations<cr>', '[G]oto [I]mplementation')
			nmap('gr', vim.lsp.buf.rename, '[R]e[n]ame')
			nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
			nmap('<leader>D', '<cmd>Telescope lsp_type_definitions<cr>', 'Type [D]efinitions')
			nmap('<leader>dj', go_to_diagnostic(true), 'Next [D]iagnostic')
			nmap('<leader>dk', go_to_diagnostic(false), 'Prev [D]iagnostic')
			nmap('<leader>ds', '<cmd>Telescope lsp_document_symbols<cr>', '[D]ocument [S]ymbols')
			nmap('<leader>Ej', go_to_diagnostic(true, 'ERROR'), 'Next Error')
			nmap('<leader>Ek', go_to_diagnostic(false, 'ERROR'), 'Prev Error')
			nmap('<leader>fd', '<cmd>Telescope diagnostics<cr>', '[F]ind [D]iagnostics')
			nmap('<leader>ld', vim.diagnostic.open_float, '[L]ine [D]iagnostics')
			nmap('<leader>li', '<cmd>LspInfo<cr>', 'Lsp Info')
			nmap('<Leader>ll', '<cmd>LspLog<cr>', 'Lsp Log')
			nmap('<Leader>lr', '<cmd>LspRestart<cr>', 'Lsp Restart')
			nmap('<leader>wj', go_to_diagnostic(true, 'WARN'), 'Next Warning')
			nmap('<leader>wk', go_to_diagnostic(false, 'WARN'), 'Prev Warning')
			nmap('<leader>ws', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', '[W]orkspace [S]ymbols')

			if client.name == 'eslint' then
				client.server_capabilities.documentFormattingProvider = true
				client.server_capabilities.documentRangeFormattingProvider = true
			elseif client.name == 'ts_ls' then
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end
		end

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			settings = {
				Lua = {
					telemetry = { enable = false },
					workspace = { checkThirdParty = false },
				},
			},
		})

		lspconfig.cssls.setup({
			on_attach = on_attach,
			settings = {
				css = {
					validate = true,
					lint = { unknownAtRules = 'ignore' },
				},
			},
		})

		lspconfig.eslint.setup({
			on_attach = function(_, bufnr)
				vim.api.nvim_create_autocmd('BufWritePre', {
					buffer = bufnr,
					command = 'EslintFixAll',
				})
			end,
			settings = {
				workingDirectory = { mode = 'auto' },
			},
		})

		lspconfig.tailwindcss.setup({
			on_attach = on_attach,
			root_dir = function(fname)
				local util = require('lspconfig.util')

				return util.root_pattern(
					'postcss.config.cjs',
					'postcss.config.js',
					'postcss.config.mjs',
					'postcss.config.ts',
					'tailwind.config.cjs',
					'tailwind.config.js',
					'tailwind.config.mjs',
					'tailwind.config.ts'
				)(fname) and util.find_package_json_ancestor(fname) and util.find_node_modules_ancestor(fname) and util.find_git_ancestor(
					fname
				)
			end,
		})

		local regular_servers = {
			'gopls',
			'html',
			'jsonls',
			-- 'markdown_oxide',
			'marksman',
			'svelte',
			'taplo',
			'vimls',
		}

		for _, regular_server in ipairs(regular_servers) do
			lspconfig[regular_server].setup({
				on_attach = on_attach,
			})
		end
	end,
}
