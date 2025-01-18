---@type LazySpec
return {
	'nvim-telescope/telescope.nvim',
	enabled = true,

	cmd = 'Telescope',
	dependencies = { 'nvim-telescope/telescope-fzf-native.nvim' },
	version = false,

	keys = function()
		local builtin = require('telescope.builtin')

		return {
			{
				'<leader>/',
				function()
					builtin.current_buffer_fuzzy_find()
				end,
				desc = '[/] Fuzzily search in currrent buffer',
			},
			{
				'<leader><leader>en',
				function()
					builtin.find_files({ cwd = vim.fn.stdpath('config') })
				end,
				desc = '[E]dit [N]eovim',
			},
			{
				'<leader><leader>ep',
				function()
					local lazy_plugins_path = vim.fs.joinpath(tostring(vim.fn.stdpath('data')), 'lazy')

					builtin.find_files({ cwd = lazy_plugins_path })
				end,
				desc = '[E]dit [P]ackages',
			},
			{ '<leader>?', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
			{ '<leader>fa', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
			{ '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = '[F]ind [H]elp Tags' },
			{ '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Find [K]eymaps' },
			{ '<leader>fr', '<cmd>Telescope registers<cr>', desc = '[F]ind [R]egisters' },
			{ '<leader>fw', '<cmd>Telescope grep_string<cr>', mode = { 'n', 'v' }, desc = 'Grep String' },
			{ '<leader>gb', '<cmd>Telescope git_branches<cr>', desc = '[G]it [B]ranches' },
			{ '<leader>gc', '<cmd>Telescope git_commits<cr>', desc = '[G]it [C]ommits' },
			{ '<leader>;gc', '<cmd>Telescope git_bcommits<cr>', desc = '[G]it B[C]ommits' },
			{ '<leader>;gs', '<cmd>Telescope git_stash<cr>', desc = '[G]it [S]tash' },
			{ '<leader>gs', '<cmd>Telescope git_status<cr>', desc = '[G]it [S]tatus' },
			{ '<leader>man', '<cmd>Telescope man_pages<cr>', desc = '[MAN] pages' },
			{ '<leader>sp', '<cmd>Telescope spell_suggest<cr>', desc = '[S][p]ell Suggest' },
			{ '<leader>t', '<cmd>Telescope<cr>', desc = '[T]elescope' },
		}
	end,
	config = function()
		local actions = require('telescope.actions')
		local telescope = require('telescope')

		telescope.setup({
			defaults = {
				entry_prefix = '  ',
				layout_config = { prompt_position = 'top' },
				multi_icon = ' 󰗠 ',
				prompt_prefix = '   ',
				selection_caret = '  ',
				sorting_strategy = 'ascending',
				preview = { timeout = 284 },
				mappings = {
					i = {
						['<C-j>'] = actions.cycle_history_next,
						['<C-k>'] = actions.cycle_history_prev,
					},
				},
			},
			pickers = {
				current_buffer_fuzzy_find = { theme = 'dropdown', previewer = false },
				buffers = {
					ignore_current_buffer = true,
					sort_mru = true,
					previewer = false,
					layout_config = {
						horizontal = {
							width = 0.5,
							height = 0.4,
						},
					},
				},
				git_status = {
					previewer = false,
					theme = 'dropdown',

					-- TODO: Change to use icons
					git_icons = {
						added = 'A',
						changed = 'M',
						copied = 'C',
						deleted = 'D',
						renamed = 'R',
						unmerged = 'U',
						untracked = '?',
					},
				},
				spell_suggest = {
					layout_config = { horizontal = { height = 0.4, width = 0.4 } },
					previewer = false,
					theme = 'dropdown',
				},
			},
			extensions = {
				fzf = { case_mode = 'ignore_case' },
				fzy_native = {},

				---@type FrecencyConfig
				frecency = {
					ignore_patterns = { '*.git/*', '*/tmp/*', 'term://*' },
					matcher = 'fuzzy',
					path_display = { 'shorten' },
					show_scores = false,
					workspace_scan_cmd = 'rg -.g \'!.git\' --files',
				},
			},
		})
	end,
}
