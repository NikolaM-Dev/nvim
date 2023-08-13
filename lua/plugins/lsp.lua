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
	end,
}
