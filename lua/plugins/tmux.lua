---@module 'lazy.types'
---@type LazySpec
return {
	'aserowy/tmux.nvim',
	desc = 'tmux integration for nvim features pane movement and resizing from within nvim',
	enabled = false,

	event = 'VeryLazy',

	keys = {
		-- stylua: ignore start
		{ '<C-h>', '<cmd>lua require("tmux").move_left()<cr>', desc = '  Change Focus to Left Window', mode = { 'n', 't' } },
		{ '<C-j>', '<cmd>lua require("tmux").move_bottom()<cr>', desc = '  Change Focus to Down Window', mode = { 'n', 't' } },
		{ '<C-k>', '<cmd>lua require("tmux").move_top()<cr>', desc = '  Change Focus to Top Window', mode = { 'n', 't' } },
		{ '<C-l>', '<cmd>lua require("tmux").move_right()<cr>', desc = '  Change Focus to Right Window', mode = { 'n', 't' } },

		{ '<M-h>', '<cmd>lua require("tmux").resize_left(2)<cr>', desc = '  Resize pane left', mode = { 'n', 't' } },
    	{ '<M-j>', '<cmd>lua require("tmux").resize_bottom(2)<cr>', desc = '  Resize pane down', mode = { 'n', 't' } },
    	{ '<M-k>', '<cmd>lua require("tmux").resize_top(2)<cr>', desc = '  Resize pane up', mode = { 'n', 't' } },
    	{ '<M-l>', '<cmd>lua require("tmux").resize_right(2)<cr>', desc = '  Resize pane right', mode = { 'n', 't' } },
		-- stylua: ignore end
	},

	---@type table
	opts = {
		copy_sync = { sync_clipboard = false },
		navigation = { enable_default_keybindings = false },
		resize = { enable_default_keybindings = false },
	},
}
