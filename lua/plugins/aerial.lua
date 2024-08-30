---@type LazySpec
return {
	'stevearc/aerial.nvim',
	enabled = true,
	---@type table
	opts = {},

	---@param opts? table
	config = function(_, opts)
		require('aerial').setup(opts)
		require('telescope').load_extension('aerial')
	end,
}
