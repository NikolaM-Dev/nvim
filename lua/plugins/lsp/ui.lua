local M = {}

function M.setup_signs()
	local signs = { Error = '', Hint = '', Info = '', Warn = '' }

	for name, icon in pairs(signs) do
		local hl = 'DiagnosticSign' .. name
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

function M.setup_lsp()
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

function M.setup()
	M.setup_lsp()
	M.setup_signs()
end

return M
