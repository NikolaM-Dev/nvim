---@module 'lazy'
---@type LazySpec
return {
	'aserowy/tmux.nvim',
	desc = 'tmux integration for nvim features pane movement and resizing from within nvim',
	enabled = true,

	event = 'VeryLazy',

	---@type table
	opts = {
		copy_sync = { sync_clipboard = false },
	},
}
