return {
	'potamides/pantran.nvim',
	enabled = false,

	cmd = 'Pantran',
	keys = {
		{ '<leader>tl', '<cmd>Pantran<cr>', desc = 'Translator' },
	},
	config = function()
		require('pantran').setup({
			default_engine = 'google',
			engines = {
				google = {
					fallback = {
						default_source = 'es',
						default_target = 'en',
					},
				},
			},
			ui = {
				height_percentage = 0.6,
				width_percentage = 0.9,
			},
			select = {
				prompt_prefix = ' ',
				selection_caret = '  ',
			},
			window = { window_config = { border = 'rounded' } },
		})
	end,
}
