return {
	'AckslD/nvim-neoclip.lua',
	keys = { { '<leader>c', '<cmd>Telescope neoclip<cr>', desc = 'Clipboard' } },
	opts = {
		continuous_sync = true,
		db_path = os.getenv('HOME') .. '/.cache/nvim/neoclip/neoclip.sqlite3',
		enable_persistent_history = true,
	},
}
