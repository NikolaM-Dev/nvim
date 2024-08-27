vim.api.nvim_create_user_command('ClearNotifications', function()
	require('notify').dismiss({ silent = true, pending = true })
end, { desc = 'Clear notifications' })

---@type LazySpec
return {
	'rcarriga/nvim-notify',
	enabled = true,

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
				ERROR = '󰅙',
				INFO = '󰋼',
				TRACE = '',
				WARN = '',
			},
			background_colour = '#000000',
			render = 'compact',
			timeout = 1000,
		})

		vim.notify = notify.notify
	end,
}
