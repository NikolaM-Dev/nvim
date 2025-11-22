---@module 'lazy.types'
---@type LazySpec
return {
	'sindrets/diffview.nvim',
	desc = 'Single tabpage interface for easily cycling through diffs for all modified files for any git rev.',
	enabled = true,

	keys = {
		{ '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Open [G]it [D]iff ' },
		{ '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'File [H]istory' },
		{ '<leader>;gh', '<cmd>DiffviewFileHistory<cr>', desc = 'Workspace [H]istory' },
	},

	-- TODO: Refactor to use options
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
						'u',
						actions.scroll_view(-0.25),
						{ desc = 'Scroll The View [U]p' },
					},
					{
						'n',
						'd',
						actions.scroll_view(0.25),
						{ desc = 'Scroll The View [D]own' },
					},
					{
						'n',
						'f',
						false,
						{ desc = '[Disabled] Flatten empty subdirectories in tree listing style' },
					},
					{
						'n',
						'i',
						false,
						{ desc = '[Disabled] Toggle between \'list\' and \'tree\' views' },
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

				diff3 = {
					{
						{ 'n', 'x' },
						'1do',
						actions.diffget('ours'),
						{ desc = '[1] Obtain the diff hunk from the OURS version of the file' },
					},
					{
						{ 'n', 'x' },
						'2do',
						actions.diffget('theirs'),
						{ desc = '[2] Obtain the diff hunk from the THEIRS version of the file' },
					},
					{
						{ 'n', 'x' },
						'3do',
						actions.diffget('base'),
						{ desc = '[3] Obtain the diff hunk from the BASE version of the file' },
					},
				},
			},
		})
	end,
}
