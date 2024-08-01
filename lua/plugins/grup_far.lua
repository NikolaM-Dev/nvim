---@type LazySpec
return {
	'MagicDuck/grug-far.nvim',
	enabled = true,

	cmd = 'GrugFar',
	---@type GrugFarOptionsOverride
	opts = {
		-- TODO: Change icons
	},

	config = function(_, opts)
		require('grug-far').setup(opts)
	end,
}
