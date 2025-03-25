---@type LazySpec
return {
	'NeogitOrg/neogit',
	enabled = false,

	cmd = 'Neogit',
	config = true,

	keys = {
		{ '<leader>gg', '<cmd>Neogit<cr>', desc = 'Neo[G]it' },
		{
			'<leader>gcm',
			function()
				require('neogit').action('commit', 'commit')()
			end,
			desc = 'Neo[G]it [C]ommit',
		},
	},
}
