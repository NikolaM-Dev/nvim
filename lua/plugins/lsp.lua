local function signs_setup()
	local signs = { Error = '󰅙', Hint = '󰌵', Info = '󰋼', Warn = '' }

	for name, icon in pairs(signs) do
		local hl = 'DiagnosticSign' .. name

		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

local function diagnostics_setup()
	local diagnostics = {
		float = { header = { 'Diagnostics', 'Title' }, border = 'rounded' },
		severity_sort = true,
		virtual_text = { prefix = '🔥', spacing = 2 },
	}

	vim.diagnostic.config(diagnostics)
end

local function lsp_handlers_setup()
	require('lspconfig.ui.windows').default_options.border = 'rounded'

	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = 'rounded',
	})

	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = 'rounded',
		focusable = false,
		relative = 'cursor',
	})
end

local function diagnostic_goto(next, severity)
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

		local on_attach = function(_, bufnr)
			vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

			local nmap = function(keys, func, desc)
				if desc then
					desc = 'LSP: ' .. desc
				end

				vim.keymap.set('n', keys, func, {
					buffer = bufnr,
					desc = desc,
					silent = true,
				})
			end

			nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
			nmap('ga', vim.lsp.buf.code_action, '[C]ode [A]ction')
			nmap('gd', '<cmd>Telescope lsp_definitions<cr>', '[G]o to [D]efinition')
			nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
			nmap('gI', '<cmd>Telescope lsp_implementations<cr>', '[G]oto [I]mplementation')
			nmap('gr', vim.lsp.buf.rename, '[R]e[n]ame')
			nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
			nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
			nmap('<leader>D', '<cmd>Telescope lsp_type_definitions<cr>', 'Type [D]efinitions')
			nmap('<leader>dj', diagnostic_goto(true), 'Next [D]iagnostic')
			nmap('<leader>dk', diagnostic_goto(false), 'Prev [D]iagnostic')
			nmap('<leader>ds', '<cmd>Telescope lsp_document_symbols<cr>', '[D]ocument [S]ymbols')
			nmap('<leader>Ej', diagnostic_goto(true, 'ERROR'), 'Next Error')
			nmap('<leader>Ek', diagnostic_goto(false, 'ERROR'), 'Prev Error')
			nmap('<leader>K', vim.lsp.buf.hover, 'Hover')
			nmap('<leader>ld', vim.diagnostic.open_float, '[L]ine [D]iagnostics')
			nmap('<leader>li', '<cmd>LspInfo<cr>', 'Lsp Info')
			nmap('<Leader>ll', '<cmd>LspLog<cr>', 'Lsp Log')
			nmap('<Leader>lr', '<cmd>LspRestart<cr>', 'Lsp Restart')
			nmap('<leader>sd', '<cmd>FzfLua diagnostics_workspace<cr>', '[S]earch [D]iagnostics')
			nmap('<leader>wj', diagnostic_goto(true, 'WARN'), 'Next Warning')
			nmap('<leader>wk', diagnostic_goto(false, 'WARN'), 'Prev Warning')
			nmap('<leader>ws', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', '[W]orkspace [S]ymbols')
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

		local regular_servers = {
			'angularls',
			'eslint',
			'gopls',
			'html',
			'jsonls',
			'tailwindcss',
			'taplo',
			'tsserver',
			'vimls',
		}

		for _, regular_server in ipairs(regular_servers) do
			lspconfig[regular_server].setup({
				on_attach = on_attach,
			})
		end
	end,
}
