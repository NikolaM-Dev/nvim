---@module 'lazy.types'
---@type LazySpec
return {
	'juniorsundar/refer.nvim',
	desc = 'Picker that doesn\'t get in your way',
	enabled = true,

	cmd = 'Refer',

	keys = {
		{
			'<M-x>',
			function()
				local builtin = require('refer.providers.builtin')
				builtin.commands({ max_height_percent = 0.1 })
			end,
			mode = { 'n', 'v' },
		},
	},
	config = function()
		require('refer').setup({
			keymaps = {
				[';'] = function(_selection, builtin)
					builtin.actions.complete_selection()
					builtin.actions.select_entry()
				end,
			},
		})
	end,
}
