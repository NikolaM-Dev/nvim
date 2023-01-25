return {
	'potamides/pantran.nvim',
	cmd = 'Pantran',
	keys = { { '<leader>tl', '<cmd>Pantran<cr>', desc = 'Translator' } },
	opts = {
		default_engine = 'google',
		engines = {
			google = {
				fallback = {
					default_source = 'es',
					default_target = 'en',
				},
			},
		},
		window = { window_config = { border = 'rounded' } },
	},
}
