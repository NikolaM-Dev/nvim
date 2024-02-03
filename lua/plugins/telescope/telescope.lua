return {
	'nvim-telescope/telescope.nvim',
	cmd = 'Telescope',
	version = false,
	dependencies = {
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	keys = {
		{
			'<leader>/',
			function()
				require('telescope.builtin').current_buffer_fuzzy_find()
			end,
			desc = '[/] Fuzzily search in currrent buffer',
		},
		{ '<leader>?', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
		{ '<leader>fa', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
		{ '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = '[F]ind [H]elp Tags' },
		{ '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Find [K]eymaps' },
		{ '<leader>fr', '<cmd>Telescope registers<cr>', desc = '[F]ind [R]egisters' },
		{ '<leader>fw', '<cmd>Telescope grep_string<cr>', mode = { 'n', 'v' }, desc = 'Grep String' },
		{ '<leader>gb', '<cmd>Telescope git_branches<cr>', desc = '[G]it [B]ranches' },
		{ '<leader>;gc', '<cmd>Telescope git_bcommits<cr>', desc = '[G]it B[C]ommits' },
		{ '<leader>gc', '<cmd>Telescope git_commits<cr>', desc = '[G]it [C]ommits' },
		{ '<leader>;gs', '<cmd>Telescope git_stash<cr>', desc = '[G]it [S]tash' },
		{ '<leader>gs', '<cmd>Telescope git_status<cr>', desc = '[G]it [S]tatus' },
		{ '<leader>man', '<cmd>Telescope man_pages<cr>', desc = '[MAN] pages' },
		{ '<leader>sp', '<cmd>Telescope spell_suggest<cr>', desc = '[S][p]ell Suggest' },
		{ '<leader>t', '<cmd>Telescope<cr>', desc = '[T]elescope' },
	},
	config = function()
		local actions = require('telescope.actions')
		local layout = require('telescope.actions.layout')
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
						['<C-p>'] = layout.toggle_preview,
					},
					n = {
						['<C-p>'] = layout.toggle_preview,
						['q'] = actions.close,
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
				-- TODO: Change to use icons
				git_status = {
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
			},
		})

		telescope.load_extension('fzf')
	end,
}
