return {
	'sindrets/diffview.nvim',
	keys = {
		{ '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Git Diff (Diffview)' },
		{ '<leader>gH', '<cmd>DiffviewFileHistory %<cr>', desc = 'File History' },
		{ '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = 'Workspace History' },
	},
	config = function()
		local actions = require('diffview.actions')

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
			file_panel = {
				win_config = {
					width = 60,
				},
			},
			keymaps = {
				file_panel = {
					{
						'n',
						'<c-u>',
						actions.scroll_view(-0.25),
						{ desc = 'Scroll The View [U]p' },
					},
					{
						'n',
						'<c-d>',
						actions.scroll_view(0.25),
						{ desc = 'Scroll The View [D]own' },
					},
				},

				file_history_panel = {
					{
						'n',
						'<c-u>',
						actions.scroll_view(-0.25),
						{ desc = 'Scroll The View [U]p' },
					},
					{
						'n',
						'<c-d>',
						actions.scroll_view(0.25),
						{ desc = 'Scroll The View [D]own' },
					},
				},
			},
		})
	end,
}
