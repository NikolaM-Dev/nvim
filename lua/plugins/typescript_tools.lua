---@type LazySpec
return {
	'pmizio/typescript-tools.nvim',
	enabled = true,

	cmd = { 'TSToolsAddMissingImports', 'TSToolsRemoveUnusedImports' },
	ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },

	config = function()
		require('typescript-tools').setup({
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false

				vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

				local function go_to_diagnostic(next, severity)
					local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
					severity = severity and vim.diagnostic.severity[severity] or nil

					return function()
						go({ severity = severity })
						vim.diagnostic.open_float()
					end
				end

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
					if require('obsidian').util.cursor_on_markdown_link() then
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
				nmap('<leader>ru', '<cmd>TSToolsRemoveUnusedImports<cr>', '[W]orkspace [S]ymbols')
				nmap('<leader>am', '<cmd>TSToolsAddMissingImports<cr>', '[W]orkspace [S]ymbols')
			end,
			settings = {
				composite_mode = 'separate_diagnostic',
				publish_diagnostic_on = 'insert_leave',
				separate_diagnostic_server = true,
				-- tsserver_logs = "verbose",
				tsserver_file_preferences = {
					importModuleSpecifierPreference = 'relative',
				},
			},
		})
	end,
}
