return {
	'rcarriga/nvim-notify',
	init = function()
		local notify = require('notify')

		notify.setup({
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			icons = {
				DEBUG = '',
				ERROR = '',
				INFO = '',
				TRACE = '',
				WARN = '',
			},
			render = 'minimal',
			timeout = 1000,
		})

		vim.notify = notify.notify
	end,
}
