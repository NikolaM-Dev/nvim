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
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local signs = { Error = '', Hint = '', Info = '', Warn = '' }
for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts(noremap, silent))
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts(noremap, silent))
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	if client.name == 'tsserver' or client.name == 'sumneko_lua' then
		client.server_capabilities.documentFormattingProvider = false
	end

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	-- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
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
	'emmet_ls',
	'gopls',
	'html',
	'jsonls',
	'tailwindcss',
	'taplo',
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
