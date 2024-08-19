---@type LazySpec
return {
	'MagicDuck/grug-far.nvim',
	enabled = true,

	cmd = 'GrugFar',

	keys = {
		{
			'<leader><leader>sr',
			function()
				require('grug-far').grug_far()
			end,
			mode = { 'n', 'v' },
			desc = '[S]earch and [R]eplace',
		},
	},

	---@type GrugFarOptionsOverride
	opts = {
		-- TODO: Change icons
	},

	config = function(_, opts)
		require('grug-far').setup(opts)
	end,
}
