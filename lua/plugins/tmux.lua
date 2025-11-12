---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'aserowy/tmux.nvim',
	desc = 'tmux integration for nvim features pane movement and resizing from within nvim',
	enabled = true,

	event = 'VeryLazy',

	keys = {
		{ '<C-h>', '<cmd>lua require("tmux").move_left()<cr>', desc = 'Change Focus to Left Window', mode = 't' },
		{ '<C-j>', '<cmd>lua require("tmux").move_bottom()<cr>', desc = 'Change Focus to Down Window', mode = 't' },
		{ '<C-k>', '<cmd>lua require("tmux").move_top()<cr>', desc = 'Change Focus to Top Window', mode = 't' },
		{ '<C-l>', '<cmd>lua require("tmux").move_right()<cr>', desc = 'Change Focus to Right Window', mode = 't' },
	},

	---@type table
	opts = {
		copy_sync = { sync_clipboard = false },
	},
}
