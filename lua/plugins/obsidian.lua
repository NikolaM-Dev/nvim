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
		})
	end,
}
