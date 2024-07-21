---@type LazySpec
return {
	'MagicDuck/grug-far.nvim',
	enabled = true,
	config = function()
		---@type GrugFarOptionsOverride
		local setup_opts = {}

		require('grug-far').setup(setup_opts)
	end,
}
