return {
	'CKolkey/ts-node-action',
	keys = {
		{
			mode = { 'n', 'x' },
			'<leader>na',
			function()
				require('ts-node-action').node_action()
			end,
			desc = 'Trigger [N]ode [A]ction',
		},
	},
	config = true,
}
