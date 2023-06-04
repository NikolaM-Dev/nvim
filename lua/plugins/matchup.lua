return {
	'andymass/vim-matchup',
	event = 'BufReadPost',
	config = function()
		vim.api.nvim_set_var('matchup_matchparen_deferred_hide_delay', 0)
		vim.api.nvim_set_var('matchup_matchparen_deferred_show_delay', 42)
		vim.api.nvim_set_var('matchup_matchparen_insert_timeout', 284)
		vim.api.nvim_set_var('matchup_matchparen_offscreen', { method = 'popup' })
		vim.api.nvim_set_var('matchup_matchparen_timeout', 284)
		vim.api.nvim_set_var('matchup_text_obj_enabled', 0)
	end,
}
