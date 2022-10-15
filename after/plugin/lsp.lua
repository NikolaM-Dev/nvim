local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
	return
end

local status_cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_cmp_ok then
	return
end

local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local noremap, silent = keymap.noremap, keymap.silent
local opts = keymap.new_opts

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local signs = { Error = '', Hint = '', Info = '', Warn = '' }
for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local on_attach = function(client, bufnr)
	if client.name == 'tsserver' or client.name == 'sumneko_lua' then
		client.server_capabilities.documentFormattingProvider = false
	end

	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end

lspconfig['tsserver'].setup({
	capabilities = capabilities,
	init_options = { importModuleSpecifierPreference = 'relative' },
	on_attach = on_attach,
})

lspconfig['sumneko_lua'].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { Lua = { telemetry = { enable = false } } },
})

local servers = {
	'cssls',
	'gopls',
	'html',
	'jsonls',
	'tailwindcss',
	'taplo',
	'vimls',
	'yamlls',
}

for _, server in pairs(servers) do
	lspconfig[server].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

nmap({
	{ '<Leader>li', cmd('LspInfo'), opts(noremap, silent) },
	{ '<Leader>ll', cmd('LspLog'), opts(noremap, silent) },
	{ '<Leader>lr', cmd('LspRestart'), opts(noremap, silent) },
})

vim.diagnostic.config({
	signs = true,
	underline = true,
	update_in_insert = false,
	virtual_lines = false,
	virtual_text = { prefix = '' }, -- 
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = 'rounded',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = 'rounded',
	focusable = false,
	relative = 'cursor',
})

require('lspconfig.ui.windows').default_options.border = 'rounded'
