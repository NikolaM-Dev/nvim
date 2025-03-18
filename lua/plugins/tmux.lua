-- TODO: Review
return {
	'aserowy/tmux.nvim',
	event = 'VeryLazy',
	config = function()
		require('tmux').setup({
			copy_sync = { sync_clipboard = false },
		})
	end,
}
