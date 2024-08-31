---@type LazySpec
return {
	'stevearc/aerial.nvim',
	enabled = true,

	keys = {
		{ '<leader>fou', '<cmd>Telescope aerial<cr>', desc = '[T]oggle [O]ut[L]ine' },
	},

	---@type table
	opts = {},

	---@param opts? table
	config = function(_, opts)
		require('aerial').setup(opts)
		require('telescope').load_extension('aerial')
	end,
}
