-- TODO: Review
return {
	'aserowy/tmux.nvim',
	event = 'VeryLazy',
	config = function()
		require('plugins.tmux').setup({
			copy_sync = { sync_clipboard = false },
		})
	end,
}
