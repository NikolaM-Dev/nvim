return {
	'folke/trouble.nvim',
	cmd = { 'TroubleToggle', 'Trouble' },
	keys = {
		{ 'gR', '<cmd>TroubleToggle lsp_references<cr>', desc = 'Trouble Lsp [R]eferences' },
		{ '<leader>;d', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Trouble [D]ocument [D]iagnostics' },
		{ '<leader>;l', '<cmd>TroubleToggle loclist<cr>', desc = 'Trouble [L]oclist' },
		{ '<leader>;q', '<cmd>TroubleToggle quickfix<cr>', desc = 'Trouble [Q]uickfix ' },
		{ '<leader>;w', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Trouble [W]orkspace Diagnostics ' },
		{ '<leader>;x', '<cmd>TroubleToggle<cr>', desc = 'Toggle Trouble' },
	},
	opts = {
		auto_close = true,
		fold_closed = '',
		fold_open = '',
		padding = false,
		position = 'right',
		signs = {
			error = '󰅙',
			hint = '󰌵',
			information = '󰋼',
			other = '󰄳',
			warning = '',
		},
	},
}
