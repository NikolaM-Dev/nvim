return {
	'glepnir/mutchar.nvim',
	ft = 'go',
	config = function()
		local filters = require('mutchar.filters')

		require('mutchar').setup({
			go = {
				rules = {
					{ ';', ' :=' },
					{ ',', ' <-' },
				},
				filter = {
					filters.find_diagnostic_msg({ 'initial', 'undeclare' }),
					filters.go_arrow_symbol,
				},
				one_to_one = true,
			},
		})
	end,
}
