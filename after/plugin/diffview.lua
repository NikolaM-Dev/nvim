local status_ok, diffview = pcall(require, 'diffview')
if not status_ok then
	return
end

local keymap = require('core.keymap')
local actions = require('diffview.actions')

local autocmd = vim.api.nvim_create_autocmd
local cmd = keymap.cmd
local nmap = keymap.nmap
local opts = keymap.new_opts
local silent, noremap = keymap.silent, keymap.noremap

diffview.setup({
	diff_binaries = false, -- Show diffs for binaries
	enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
	git_cmd = { 'git' }, -- The git executable followed by default args.
	use_icons = true, -- Requires nvim-web-devicons
	show_help_hints = false, -- Show hints for how to open the help panel
	watch_index = true, -- Update views and index buffers when the git index changes.
	icons = { -- Only applies when use_icons is true.
		folder_closed = '',
		folder_open = '',
	},
	signs = {
		done = '',
		fold_closed = '',
		fold_open = '',
	},
	view = {
		-- Configure the layout and behavior of different types of views.
		-- Available layouts:
		--  'diff1_plain'
		--    |'diff2_horizontal'
		--    |'diff2_vertical'
		--    |'diff3_horizontal'
		--    |'diff3_vertical'
		--    |'diff3_mixed'
		--    |'diff4_mixed'
		-- For more info, see ':h diffview-config-view.x.layout'.
		default = {
			-- Config for changed files, and staged files in diff views.
			layout = 'diff2_horizontal',
		},
		merge_tool = {
			-- Config for conflicted files in diff views during a merge or rebase.
			layout = 'diff4_mixed',
			disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
		},
		file_history = {
			-- Config for changed files in file history views.
			layout = 'diff2_horizontal',
		},
	},
	file_panel = {
		listing_style = 'tree', -- One of 'list' or 'tree'
		tree_options = { -- Only applies when listing_style is 'tree'
			flatten_dirs = false, -- Flatten dirs that only contain one single dir
			folder_statuses = 'only_folded', -- One of 'never', 'only_folded' or 'always'.
		},
		win_config = { -- See ':h diffview-config-win_config'
			position = 'left',
			width = 35,
			win_opts = {},
		},
	},
	file_history_panel = {
		log_options = { -- See ':h diffview-config-log_options'
			git = {
				single_file = {
					diff_merges = 'combined',
				},
				multi_file = {
					diff_merges = 'first-parent',
				},
			},
			hg = {
				single_file = {},
				multi_file = {},
			},
		},
		win_config = { -- See ':h diffview-config-win_config'
			position = 'bottom',
			height = 16,
			win_opts = {},
		},
	},
	commit_log_panel = {
		win_config = { -- See ':h diffview-config-win_config'
			win_opts = {},
		},
	},
	default_args = { -- Default args prepended to the arg-list for the listed commands
		DiffviewOpen = {},
		DiffviewFileHistory = {},
	},
	hooks = {}, -- See ':h diffview-config-hooks'
	keymaps = {
		disable_defaults = false, -- Disable the default keymaps
		view = {
			-- The `view` bindings are active in the diff buffers, only when the current
			-- tabpage is a Diffview.
			{
				'n',
				'<leader>ct',
				actions.conflict_choose('theirs'),
				{ desc = 'Choose the THEIRS version of a conflict' },
			},
			{ 'n', 'cj', actions.next_conflict, { desc = 'In the merge-tool: jump to the next conflict' } },
			{ 'n', 'ck', actions.prev_conflict, { desc = 'In the merge-tool: jump to the previous conflict' } },
			{ 'n', '<C-w><C-f>', actions.goto_file_split, { desc = 'Open the file in a new split' } },
			{ 'n', '<C-w>gf', actions.goto_file_tab, { desc = 'Open the file in a new tabpage' } },
			{ 'n', 'dx', actions.conflict_choose('none'), { desc = 'Delete the conflict region' } },
			{ 'n', 'g<C-x>', actions.cycle_layout, { desc = 'Cycle through available layouts.' } },
			{ 'n', 'gf', actions.goto_file_edit, { desc = 'Open the file in a new split in the previous tabpage' } },
			{ 'n', '<leader>b', actions.toggle_files, { desc = 'Toggle the file panel.' } },
			{ 'n', '<leader>ca', actions.conflict_choose('all'), { desc = 'Choose all the versions of a conflict' } },
			{ 'n', '<leader>cb', actions.conflict_choose('base'), { desc = 'Choose the BASE version of a conflict' } },
			{ 'n', '<leader>co', actions.conflict_choose('ours'), { desc = 'Choose the OURS version of a conflict' } },
			{ 'n', '<leader>e', actions.focus_files, { desc = 'Bring focus to the file panel' } },
			{ 'n', '<s-tab>', actions.select_prev_entry, { desc = 'Open the diff for the previous file' } },
			{ 'n', '<tab>', actions.select_next_entry, { desc = 'Open the diff for the next file' } },
		},
		diff1 = {
			-- Mappings in single window diff layouts
			{ 'n', 'g?', actions.help({ 'view', 'diff1' }), { desc = 'Open the help panel' } },
		},
		diff2 = {
			-- Mappings in 2-way diff layouts
			{ 'n', 'g?', actions.help({ 'view', 'diff2' }), { desc = 'Open the help panel' } },
		},
		diff3 = {
			-- Mappings in 3-way diff layouts
			{
				{ 'n', 'x' },
				'2do',
				actions.diffget('ours'),
				{ desc = 'Obtain the diff hunk from the OURS version of the file' },
			},
			{
				{ 'n', 'x' },
				'3do',
				actions.diffget('theirs'),
				{ desc = 'Obtain the diff hunk from the THEIRS version of the file' },
			},
			{ 'n', 'g?', actions.help({ 'view', 'diff3' }), { desc = 'Open the help panel' } },
		},
		diff4 = {
			-- Mappings in 4-way diff layouts
			{
				{ 'n', 'x' },
				'1do',
				actions.diffget('base'),
				{ desc = 'Obtain the diff hunk from the BASE version of the file' },
			},
			{
				{ 'n', 'x' },
				'2do',
				actions.diffget('ours'),
				{ desc = 'Obtain the diff hunk from the OURS version of the file' },
			},
			{
				{ 'n', 'x' },
				'3do',
				actions.diffget('theirs'),
				{ desc = 'Obtain the diff hunk from the THEIRS version of the file' },
			},
			{ 'n', 'g?', actions.help({ 'view', 'diff4' }), { desc = 'Open the help panel' } },
		},
		file_panel = {
			{
				'n',
				'f',
				actions.toggle_flatten_dirs,
				{ desc = 'Flatten empty subdirectories in tree listing style.' },
			},
			{ 'n', '<2-LeftMouse>', actions.select_entry, { desc = 'Open the diff for the selected entry.' } },
			{ 'n', 's', actions.toggle_stage_entry, { desc = 'Stage / unstage the selected entry.' } },
			{ 'n', '<c-b>', actions.scroll_view(-0.25), { desc = 'Scroll the view up' } },
			{ 'n', '<c-f>', actions.scroll_view(0.25), { desc = 'Scroll the view down' } },
			{ 'n', '<cr>', actions.focus_entry, { desc = 'Open the diff for the selected entry.' } },
			{ 'n', '<C-w><C-f>', actions.goto_file_split, { desc = 'Open the file in a new split' } },
			{ 'n', '<C-w>gf', actions.goto_file_tab, { desc = 'Open the file in a new tabpage' } },
			{ 'n', '<down>', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
			{ 'n', 'g?', actions.help('file_panel'), { desc = 'Open the help panel' } },
			{ 'n', 'g<C-x>', actions.cycle_layout, { desc = 'Cycle available layouts' } },
			{ 'n', 'gf', actions.goto_file_edit, { desc = 'Open the file in a new split in the previous tabpage' } },
			{ 'n', 'i', actions.listing_style, { desc = 'Toggle between \'list\' and \'tree\' views' } },
			{ 'n', 'j', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
			{ 'n', 'k', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry.' } },
			{ 'n', 'L', actions.open_commit_log, { desc = 'Open the commit log panel.' } },
			{ 'n', '<leader>b', actions.toggle_files, { desc = 'Toggle the file panel' } },
			{ 'n', '<leader>e', actions.focus_files, { desc = 'Bring focus to the file panel' } },
			{ 'n', 'o', actions.select_entry, { desc = 'Open the diff for the selected entry.' } },
			{ 'n', 'R', actions.refresh_files, { desc = 'Update stats and entries in the file list.' } },
			{ 'n', 'S', actions.stage_all, { desc = 'Stage all entries.' } },
			{ 'n', '<s-tab>', actions.select_prev_entry, { desc = 'Open the diff for the previous file' } },
			{ 'n', '<tab>', actions.select_next_entry, { desc = 'Open the diff for the next file' } },
			{ 'n', 'U', actions.unstage_all, { desc = 'Unstage all entries.' } },
			{ 'n', '<up>', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry.' } },
			{ 'n', ']x', actions.next_conflict, { desc = 'Go to the next conflict' } },
			{ 'n', '[x', actions.prev_conflict, { desc = 'Go to the previous conflict' } },
			{ 'n', 'X', actions.restore_entry, { desc = 'Restore entry to the state on the left side.' } },
		},
		file_history_panel = {
			{ 'n', '<2-LeftMouse>', actions.select_entry, { desc = 'Open the diff for the selected entry.' } },
			{ 'n', '<C-A-d>', actions.open_in_diffview, { desc = 'Open the entry under the cursor in a diffview' } },
			{ 'n', '<c-b>', actions.scroll_view(-0.25), { desc = 'Scroll the view up' } },
			{ 'n', '<c-f>', actions.scroll_view(0.25), { desc = 'Scroll the view down' } },
			{ 'n', '<cr>', actions.focus_entry, { desc = 'Open the diff for the selected entry.' } },
			{ 'n', '<C-w><C-f>', actions.goto_file_split, { desc = 'Open the file in a new split' } },
			{ 'n', '<C-w>gf', actions.goto_file_tab, { desc = 'Open the file in a new tabpage' } },
			{ 'n', '<down>', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
			{ 'n', 'g?', actions.help('file_history_panel'), { desc = 'Open the help panel' } },
			{ 'n', 'g!', actions.options, { desc = 'Open the option panel' } },
			{ 'n', 'g<C-x>', actions.cycle_layout, { desc = 'Cycle available layouts' } },
			{ 'n', 'gf', actions.goto_file_edit, { desc = 'Open the file in a new split in the previous tabpage' } },
			{ 'n', 'j', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
			{ 'n', 'k', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry.' } },
			{ 'n', 'L', actions.open_commit_log, { desc = 'Show commit details' } },
			{ 'n', '<leader>b', actions.toggle_files, { desc = 'Toggle the file panel' } },
			{ 'n', '<leader>e', actions.focus_files, { desc = 'Bring focus to the file panel' } },
			{ 'n', 'o', actions.select_entry, { desc = 'Open the diff for the selected entry.' } },
			{ 'n', '<s-tab>', actions.select_prev_entry, { desc = 'Open the diff for the previous file' } },
			{ 'n', '<tab>', actions.select_next_entry, { desc = 'Open the diff for the next file' } },
			{ 'n', '<up>', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry.' } },
			{ 'n', 'y', actions.copy_hash, { desc = 'Copy the commit hash of the entry under the cursor' } },
			{ 'n', 'zM', actions.close_all_folds, { desc = 'Collapse all folds' } },
			{ 'n', 'zR', actions.open_all_folds, { desc = 'Expand all folds' } },
		},
		option_panel = {
			{ 'n', '<tab>', actions.select_entry, { desc = 'Change the current option' } },
			{ 'n', 'q', actions.close, { desc = 'Close the panel' } },
			{ 'n', 'g?', actions.help('option_panel'), { desc = 'Open the help panel' } },
		},
		help_panel = {
			{ 'n', 'q', actions.close, { desc = 'Close help menu' } },
			{ 'n', '<esc>', actions.close, { desc = 'Close help menu' } },
		},
	},
})

nmap({
	{ '<leader>bh', cmd('DiffviewFileHistory %'), opts(noremap, silent) },
	{ '<leader>gd', cmd('DiffviewOpen'), opts(noremap, silent) },
	{ '<leader>gh', cmd('DiffviewFileHistory'), opts(noremap, silent) },
})

autocmd({ 'Filetype' }, {
	group = _G.nikola_group,
	pattern = 'DiffviewFiles',
	callback = function()
		local buff = tonumber(vim.fn.expand('<abuf>'), 10)

		vim.keymap.set('n', '<C-q>', cmd('DiffviewClose'), { noremap = true, buffer = buff })
	end,
})

autocmd({ 'Filetype' }, {
	group = _G.nikola_group,
	pattern = 'DiffviewFileHistory',
	callback = function()
		local buff = tonumber(vim.fn.expand('<abuf>'), 10)

		vim.keymap.set('n', '<C-q>', cmd('DiffviewClose'), { noremap = true, buffer = buff })
	end,
})
