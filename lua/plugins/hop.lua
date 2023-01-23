return {
	'phaazon/hop.nvim',
	event = 'BufRead',
	keys = { { 'f', '<cmd>Telescope buffers<cr>', desc = 'Jump to word', mode = { 'n', 'v' } } },
	opts = { keys = 'asdghklqwertyuiopzxcvbnmfj' },
}
