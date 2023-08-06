return {
	'danielfalk/smart-open.nvim',
	keys = {
		{
			'<leader>ff',
			function()
				require('telescope').extensions.smart_open.smart_open({ cwd_only = true })
			end,
			desc = '[F]ind Smart Open',
		},
	},

	config = function()
		require('telescope').load_extension('smart_open')
	end,
}
