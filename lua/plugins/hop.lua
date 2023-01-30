return {
	'phaazon/hop.nvim',
	event = 'BufRead',
	keys = { { 'f', '<cmd>HopWord<cr>', desc = 'Jump to word', mode = { 'n', 'v' } } },
	opts = { keys = 'asdghklqwertyuiopzxcvbnmfj' },
}
