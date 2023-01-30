return {
	'windwp/nvim-spectre',
	keys = {
		{
			'<leader>sr',
			function()
				require('spectre').open()
			end,
			desc = 'Replace in files (Spectre)',
		},
	},
	config = function()
		require('spectre').setup()
	end,
}
