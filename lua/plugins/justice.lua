---@module 'lazy.types'
---@type LazySpec
return {
	'chrisgrieser/nvim-justice',
	desc = ' Just an integration of `just` in nvim.',
	enabled = true,

	keys = {
		{
			'<leader>sj',
			function()
				require('justice').select()
			end,
			desc = '[S]earch [J]ust Recipes',
		},
	},

	config = true,
}
