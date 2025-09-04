---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'nvim-mini/mini.trailspace',
	desc = 'Plugin to manage trailspace (highlight and remove)',
	enabled = true,

	event = 'VeryLazy',

	---@type table
	opts = {},

	---@param opts? table
	config = function(_, opts)
		require('mini.trailspace').setup(opts)

		vim.api.nvim_set_hl(0, 'MiniTrailspace', { bg = '', fg = '#45475a' })
	end,
}
