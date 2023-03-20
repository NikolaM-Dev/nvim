return {
	'nullchilly/fsread.nvim',
	cmd = { 'FSToggle', 'FSRead', 'FSClear' },
	keys = {
		{ '<leader>fs', '<cmd>FSToggle<cr>', desc = 'Toggle [F][S]Toggle' },
		{ '<leader><leader>fs', '<cmd>FSRead<cr>', desc = 'Toggle [F][S][R]ead' },
	},
}
