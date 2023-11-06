return {
	'Darazaki/indent-o-matic',
	event = { 'VimEnter', 'BufReadPost', 'BufNewFile' },
	config = function()
		require('indent-o-matic').setup({})
	end,
}
