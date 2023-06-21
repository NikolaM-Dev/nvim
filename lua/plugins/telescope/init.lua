-- TODO: Separate telescope from smart open
return {
	'nvim-telescope/telescope.nvim',
	cmd = 'Telescope',
	version = false,
	dependencies = {
		'danielfalk/smart-open.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	keys = {
		{
			'<leader>ff',
			function()
				require('telescope').extensions.smart_open.smart_open({ cwd_only = true })
			end,
			desc = '[F]ind Smart Open',
		},
		{
			'<leader>/',
			function()
				require('telescope.builtin').current_buffer_fuzzy_find()
			end,
			desc = '[/] Fuzzily search in currrent buffer',
		},
		{ '<leader>b', '<cmd>Telescope buffers<cr>', desc = '[B]uffers' },
		{ '<leader>?', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
		{ '<leader>fa', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
		{ '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = '[F]ind [H]elp Tags' },
		{ '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = '[S][p]ell Suggest' },
		{ '<leader>fo', '<cmd>Telescope oldfiles<cr>', desc = '[F]ind [O]ld Files' },
		{ '<leader>fw', '<cmd>Telescope grep_string<cr>', mode = { 'n', 'v' }, desc = 'Grep String' },
		{ '<leader>gb', '<cmd>Telescope git_branches<cr>', desc = '[G]it [B]ranches' },
		{ '<leader>;gc', '<cmd>Telescope git_bcommits<cr>', desc = '[G]it B[C]ommits' },
		{ '<leader>gc', '<cmd>Telescope git_commits<cr>', desc = '[G]it [C]ommits' },
		{ '<leader>;gs', '<cmd>Telescope git_stash<cr>', desc = '[G]it [S]tash' },
		{ '<leader>gs', '<cmd>Telescope git_status<cr>', desc = '[G]it [S]tatus' },
		{ '<leader>man', '<cmd>Telescope man_pages<cr>', desc = '[MAN] pages' },
		{ '<leader>sp', '<cmd>Telescope spell_suggest<cr>', desc = 'Find [K]eymaps' },
		{ '<leader>t', '<cmd>Telescope<cr>', desc = '[T]elescope' },
	},
	config = function()
		local actions = require('telescope.actions')
		local layout = require('telescope.actions.layout')
		local telescope = require('telescope')
		local trouble = require('trouble.providers.telescope')

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
						['<c-t>'] = trouble.open_with_trouble,
					},
					n = {
						['<C-p>'] = layout.toggle_preview,
						['<c-t>'] = trouble.open_with_trouble,
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
				smart_open = {
					match_algorithm = 'fzf',
					ignore_patterns = {
						'*~',
						'~:',
						'*.7z',
						'*.apk',
						'*.bak',
						'*.bin',
						'*build/*',
						'*.bz2',
						'*.class',
						'*.ctags',
						'*.cur',
						'*.db',
						'*debug/*',
						'*.dll',
						'*.doc',
						'*.doc',
						'*.DS_Store',
						'*.gif',
						'*.git/*',
						'*.gz',
						'*.ico',
						'*.ico',
						'*.jar',
						'*.jpeg',
						'*.jpg',
						'*.lock',
						'*.lzma',
						'*.min.gzip.js',
						'*.min.js',
						'*.node',
						'*node_modules/*',
						'*.otf',
						'*.pack',
						'*.pcf',
						'*.pdb',
						'*.pdf',
						'*.pdf',
						'*.png',
						'*.ppt',
						'*.pyc',
						'*.rar',
						'*.rlib',
						'*.rmeta',
						'*.ser',
						'*.sfd',
						'*.so',
						'*.so',
						'*.spl',
						'*.svg',
						'*.swp',
						'*.ttf',
						'*.wasm',
						'*.woff*',
						'*.xls',
						'*.zip',
					},
				},
			},
		})

		telescope.load_extension('fzf')
		telescope.load_extension('smart_open')
	end,
}
