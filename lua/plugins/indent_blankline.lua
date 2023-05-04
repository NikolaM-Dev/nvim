return {
	'lukas-reineke/indent-blankline.nvim',
	event = { 'BufNewFile', 'BufReadPre', 'BufAdd' },
	opts = {
		buftype_exclude = { 'help', 'loclist', 'nofile', 'prompt', 'quickfix', 'terminal' },
		filetype_exclude = { 'help', 'Trouble', 'lazy', 'list' },
	},
}
