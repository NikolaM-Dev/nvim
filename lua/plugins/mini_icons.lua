---@module 'lazy'
---@type LazySpec
return {
	'echasnovski/mini.icons',
	desc = 'Icon provider',
	enabled = true,

	event = 'VeryLazy',

	---@type table
	opts = {
	},

	---@param opts? table
	config = function(_, opts)
		require('mini.icons').setup(opts)
		require('mini.icons').mock_nvim_web_devicons()
	end,
}
