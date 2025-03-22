---@type LazySpec
return {
	'NeogitOrg/neogit',
	enabled = true,

	cmd = 'Neogit',
	config = true,

	keys = {
		{ '<C-x>g', '<cmd>Neogit<cr>', desc = 'Neo[G]it' },
	},
}
