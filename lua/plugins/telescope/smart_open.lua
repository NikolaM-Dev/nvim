local map = require('lib.map')

---@type LazySpec
return {
	'danielfalk/smart-open.nvim',
	enabled = true,

	branch = '0.2.x',
	keys = {
		{ '<leader>ff', map:cmd('Telescope smart_open'), desc = '[F]ind Smart Open' },
	},
	config = function()
		require('telescope').load_extension('smart_open')

		local config = require('smart-open').config

		config.cwd_only = true
		config.open_buffer_indicators = { others = ' ', previous = ' ' }
		config.show_scores = true
	end,
}
