return {
	'glepnir/lspsaga.nvim',
	event = 'BufRead',
	keys = {
		{ 'ga', '<cmd>Lspsaga code_action<cr>', desc = 'Code [A]ction' },
		{ 'gh', '<cmd>Lspsaga lsp_finder<cr>', desc = 'Lsp Finder' },
		{ 'gr', '<cmd>Lspsaga rename<cr>', desc = '[R]ename' },
		{ 'K', '<cmd>Lspsaga hover_doc<cr>', desc = 'Hover' },
		{ '<leader>dj', '<cmd>Lspsaga diagnostic_jump_next<cr>', desc = 'Next [D]iagnostic' },
		{ '<leader>dk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', desc = 'Prev [D]iagnostic' },
	},
	config = function()
		require('lspsaga').setup({
			scroll_preview = {
				scroll_down = '<C-d>',
				scroll_up = '<C-u>',
			},
			diagnostic = { on_insert = false },
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
