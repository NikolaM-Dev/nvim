---@type LazySpec
return {
	'stevearc/aerial.nvim',
	enabled = true,
	opts = {},

	config = function(_, opts)
		require('aerial').setup(opts)
		require('telescope').load_extension('aerial')
	end,
}
