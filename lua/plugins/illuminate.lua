return {
	'RRethy/vim-illuminate',
	event = { 'BufNewFile', 'BufRead', 'BufAdd' },
	config = function()
		require('illuminate').configure({
			delay = 200,
			max_file_lines = 400,
		})
	end,
}
