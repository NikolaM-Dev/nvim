return {
	'lukas-reineke/indent-blankline.nvim',
	event = { 'BufReadPost', 'BufNewFile' },
	opts = {
		filetype_exclude = { 'help', 'Trouble', 'lazy' },
		show_current_context_start = true,
		show_current_context = true,
		space_char_blankline = ' ',
	},
}
