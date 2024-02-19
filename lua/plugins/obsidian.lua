return {
	'epwalsh/obsidian.nvim',
	version = '*',
	ft = 'markdown',
	config = function()
		---@diagnostic disable: missing-fields
		require('obsidian').setup({
			workspaces = {
				{
					name = 'second-brain.md',
					path = '~/Documents/second-brain.md',
				},
			},
			daily_notes = {
				folder = '001-calendar/dailies',
				date_format = '%Y-%m-%d',
				alias_format = '%A, %d %B %Y',
				template = nil,
			},
			follow_url_func = function(url)
				vim.fn.jobstart({ 'google-chrome-stable', url })
			end,
		})
	end,
}
