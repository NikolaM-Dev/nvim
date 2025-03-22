---@type LazySpec
return {
	'aserowy/tmux.nvim',
	enabled = true,

	event = 'VeryLazy',

	opts = {
		copy_sync = { sync_clipboard = false },
	},
}
