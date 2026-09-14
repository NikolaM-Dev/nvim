---@module 'lazy.types'
---@type LazySpec
return {
	'carderne/pi-nvim',
	desc = 'Bridge between pi coding agent and Neovim',
	enabled = true,

	keys = {
		-- stylua: ignore start
		{ '<C-.>', '<cmd>Pi<cr>', desc = '  Pi Send dialog', mode = { 'n', 'x' } },
		{ '<leader>ab', '<cmd>PiSendBuffer<cr>', desc = '  Pi Send buffer' },
		{ '<leader>ad', '<cmd>PiSessions<cr>', desc = '  Pi List or switch sessions' },
		{ '<leader>af', '<cmd>PiSendFile<cr>', desc = '  Pi Send file' },
		{ '<leader>ai', '<cmd>PiPing<cr>', desc = '  Pi Ping pi session' },
		{ '<leader>ap', '<cmd>PiSend<cr>', mode = { 'n', 'x' }, desc = '  Pi Send prompt' },
		{ '<leader>at', '<cmd>PiSend<cr>', mode = { 'x', 'n' }, desc = '  Pi Send this' },
		{ '<leader>av', '<cmd>PiSendSelection<cr>', mode = { 'x' }, desc = '  Pi Send visual selection' },
		-- stylua: ignore end
	},

	opts = {
		set_default_keymaps = false,
	},
}
