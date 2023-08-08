return {
	'nullchilly/fsread.nvim',
	enabled = false,
	cmd = { 'FSToggle', 'FSRead', 'FSClear' },
	keys = {
		{ '<leader>fs', '<cmd>FSToggle<cr>', desc = 'Toggle [F][S]Toggle' },
	},
}
