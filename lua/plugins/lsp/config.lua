local M = {}

M.servers = {}
M.setup = {}

function M.signs()
	local signs = { Error = '', Hint = '', Info = '', Warn = '' }

	for name, icon in pairs(signs) do
		local hl = 'DiagnosticSign' .. name
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

function M.lsp_handlers()
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

function M.diagnostics()
	local diagnostics = {
		severity_sort = true,
		virtual_text = { prefix = '🔥', spacing = 2 },
		float = { header = { 'Diagnostics', 'Title' }, border = 'rounded' },
	}

	vim.diagnostic.config(diagnostics)
end

-- LSP on_attach
function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd('LspAttach', {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end

local function setup(server)
	local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
	local server_opts = M.servers[server] or {}

	server_opts.capabilities = capabilities

	if M.setup[server] then
		if M.setup[server](server, server_opts) then
			return
		end
	elseif M.setup['*'] then
		if M.setup['*'](server, server_opts) then
			return
		end
	end

	require('lspconfig')[server].setup(server_opts)
end
end

return M
