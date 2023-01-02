local status_ok, mutchar = pcall(require, 'mutchar')
if not status_ok then
	return
end

local filters = require('mutchar.filters')

mutchar.setup({
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
