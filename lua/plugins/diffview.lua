return {
	'sindrets/diffview.nvim',
	keys = {
		{ '<leader>bh', '<cmd>DiffviewFileHistory %<cr>', desc = 'File History' },
		{ '<leader>bh', '<cmd>DiffviewFileHistory<cr>', desc = 'Workspace History' },
		{ '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Git Diff (Diffview)' },
	},
	config = function()
		local a = require('diffview.actions')

		require('diffview').setup({
			show_help_hints = false,
			icons = {
				folder_closed = '',
				folder_open = 'ﱮ',
			},
			signs = {
				done = '',
				fold_closed = '',
				fold_open = '',
			},
			merge_tool = {
				layout = 'diff4_mixed',
			},
		})
	end,
}
