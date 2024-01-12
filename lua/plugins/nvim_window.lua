return {
	'yorickpeterse/nvim-window',
	keys = {
		{
			'<leader><leader>',
			function()
				require('nvim-window').pick()
			end,
			desc = 'Jump between splits',
		},
	},
	config = function()
		require('nvim-window').setup({
			border = 'rounded',
			chars = {
				'j',
				'k',
				'l',
				';',
				'h',
				'f',
				'd',
				's',
				'a',
				'g',
			},
		})
	end,
}
