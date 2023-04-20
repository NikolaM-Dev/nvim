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
				require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
					previewer = false,
				}))
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
		local telescope = require('telescope')

		telescope.setup({
			defaults = {
				entry_prefix = '  ',
				prompt_prefix = '   ',
				selection_caret = '  ',
			},
			extensions = { smart_open = { match_algorithm = 'fzf' } },
		})

		telescope.load_extension('fzf')
		telescope.load_extension('neoclip')
		telescope.load_extension('smart_open')
	end,
}
