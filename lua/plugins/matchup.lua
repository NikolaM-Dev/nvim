return {
	'andymass/vim-matchup',
	event = 'BufReadPost',
	config = function()
		vim.g.matchup_matchparen_offscreen = { method = 'status_manual' }
	end,
}
