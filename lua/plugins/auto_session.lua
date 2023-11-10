return {
	'rmagatti/auto-session',
	event = 'VimEnter',
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require('auto-session').setup({
			log_level = vim.log.levels.ERROR,
		})
	end,
}
