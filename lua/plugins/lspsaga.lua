return {
	'glepnir/lspsaga.nvim',
	enabled = false,
	event = 'BufRead',
	keys = {
		{ 'ga', '<cmd>Lspsaga code_action<cr>', desc = 'Code Action (lspsaga)' },
		{ 'gh', '<cmd>Lspsaga lsp_finder<cr>', desc = 'References (lspsaga)' },
		{ 'gl', '<cmd>Lspsaga show_cursor_diagnostics<cr>', desc = 'Show Current Diagnostic' },
		{ 'gr', '<cmd>Lspsaga rename<cr>', desc = 'Rename (lspsaga)' },
		{ 'K', '<cmd>Lspsaga hover_doc<cr>', desc = 'Hover (lspsaga)' },
		{ '<leader>dj', '<cmd>Lspsaga diagnostic_jump_next<cr>', desc = 'Next Diagnostic (lspsaga)' },
		{ '<leader>dk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', desc = 'Prev Diagnostic (lspsaga)' },
	},
	config = function()
		require('lspsaga').setup({
			scroll_preview = {
				scroll_down = '<C-d>',
				scroll_up = '<C-u>',
			},
			symbol_in_winbar = { enable = false },
			ui = {
				border = 'rounded',
				code_action = '💡',
				collapse = '',
				diagnostic = '🔴 ',
				expand = '',
				hover = ' ',
				incoming = ' ',
				outgoing = ' ',
				preview = ' ',
				theme = 'round',
				title = true,
			},
		})
	end,
}
