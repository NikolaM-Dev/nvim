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
			follow_url_func = function(url)
				vim.fn.jobstart({ 'google-chrome-stable', url })
			end,
		})
	end,
}
