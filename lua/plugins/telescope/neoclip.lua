return {
	'AckslD/nvim-neoclip.lua',
	enabled = false,
	keys = { { '<leader>c', '<cmd>Telescope neoclip<cr>', desc = 'Clipboard' } },
	config = function()
		require('neoclip').setup({
			continuous_sync = true,
			db_path = os.getenv('HOME') .. '/.cache/nvim/neoclip/neoclip.sqlite3',
			enable_persistent_history = true,
			keys = {
				telescope = {
					i = { paste = '<cr>' },
					n = { paste = '<cr>' },
				},
			},
		})

		require('telescope').load_extension('neoclip')
	end,
}
