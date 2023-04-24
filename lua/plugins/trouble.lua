return {
	'folke/trouble.nvim',
	cmd = { 'TroubleToggle', 'Trouble' },
	keys = {
		{ '<leader>;d', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Document Diagnostics (Trouble)' },
		{ '<leader>;l', '<cmd>TroubleToggle loclist<cr>', desc = 'Loclist (Trouble)' },
		{ '<leader>;q', '<cmd>TroubleToggle quickfix<cr>', desc = 'Quickfix (Trouble)' },
		{ '<leader>;w', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Workspace Diagnostics (Trouble)' },
		{ '<leader>;x', '<cmd>TroubleToggle<cr>', desc = 'Toggle trouble' },
		{ 'gR', '<cmd>TroubleToggle lsp_references<cr>', desc = 'Lsp References (Trouble)' },
	},
	opts = {
		auto_close = true,
		fold_closed = '',
		fold_open = '',
		padding = false,
		position = 'right',
		signs = {
			error = '',
			hint = '',
			information = '',
			other = '',
			warning = '',
		},
	},
}
