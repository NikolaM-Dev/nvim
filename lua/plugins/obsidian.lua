return {
	'epwalsh/obsidian.nvim',
	version = '*',
	ft = 'markdown',
	keys = {
		{ '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = '[O]bisidan [B]acklinks' },
		{ '<leader>oo', '<cmd>ObsidianOpen<cr>', desc = '[O]pen in [O]bsidian' },
		-- d = { "<cmd>ObsidianToday<cr>", "Daily Note" },
		-- p = { '<cmd>ObsidianPasteImg<cr>', 'Paste image' },
		{ '<leader>oq', '<cmd>ObsidianQuickSwitch<cr>', '[O]sidian [Q]uick Swith' },
		{ '<leader>os', '<cmd>ObsidianSearch<cr>', '[O]sidian [S]earch' },
		{ '<leader>ot', '<cmd>ObsidianTags<cr>', '[O]sidian [T]ags' },
	},
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
