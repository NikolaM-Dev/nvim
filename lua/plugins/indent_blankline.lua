return {
	'lukas-reineke/indent-blankline.nvim',
	event = { 'BufReadPost', 'BufNewFile' },
	opts = {
		buftype_exclude = { 'help', 'loclist', 'nofile', 'prompt', 'quickfix', 'terminal' },
		filetype_exclude = { 'help', 'Trouble', 'lazy', 'list' },
		show_current_context_start = true,
		show_current_context = true,
		space_char_blankline = ' ',
	},
}
