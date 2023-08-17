return {
	'sindrets/diffview.nvim',
	keys = {
		{ '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Git Diff (Diffview)' },
		{ '<leader>gH', '<cmd>DiffviewFileHistory %<cr>', desc = 'File History' },
		{ '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = 'Workspace History' },
	},
	config = function()
		require('diffview').setup({
			show_help_hints = false,
			icons = {
				folder_closed = '󰉋',
				folder_open = '󰝰',
			},
			signs = {
				done = '󰄳',
				fold_closed = '',
				fold_open = '',
			},
			view = {
				merge_tool = {
					layout = 'diff3_mixed',
				},
			},
			},
		})
	end,
}
