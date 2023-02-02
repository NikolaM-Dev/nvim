local M = {}

local function setup_signs()
	local signs = { Error = '', Hint = '', Info = '', Warn = '' }

	for name, icon in pairs(signs) do
		local hl = 'DiagnosticSign' .. name
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

local function setup_lsp_handlers()
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

local function setup_diagnostics()
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

function M.setup_stuffs()
	setup_signs()
	setup_lsp_handlers()
	setup_diagnostics()
end

return M
