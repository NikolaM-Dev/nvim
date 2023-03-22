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
			'<leader><leader>',
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
		{ '<leader>t', '<cmd>Telescope<cr>', desc = '[T]elescope' },
		{ '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Find [K]eymaps' },
		{ '<leader>fw', '<cmd>Telescope grep_string<cr>', mode = { 'n', 'v' }, desc = 'grep_string' },
		{ '<leader>man', '<cmd>Telescope man_pages<cr>', desc = '[MAN] pages' },
	},
	config = function()
		local telescope = require('telescope')

		telescope.setup({
			defaults = {
				entry_prefix = '  ',
				prompt_prefix = '   ',
				selection_caret = '  ',
			},
			pickers = { git_files = { show_untracked = true } },
			extensions = { smart_open = { match_algorithm = 'fzf' } },
		})

		telescope.load_extension('fzf')
		telescope.load_extension('neoclip')
		telescope.load_extension('smart_open')
	end,
}
