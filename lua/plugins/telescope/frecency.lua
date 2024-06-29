---@type LazySpec
return {
	'nvim-telescope/telescope-frecency.nvim',
	enabled = false,

	keys = {
		{ '<leader>ff', '<cmd>Telescope frecency workspace=CWD<cr>', desc = '[F]ind [F]recency' },
	},
	config = function()
		require('telescope').load_extension('frecency')
	end,
}
