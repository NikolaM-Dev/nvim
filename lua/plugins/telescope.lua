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
			desc = 'Find smart open',
		},
		{ '<C-f>', '<cmd>Telescope find_files<cr>', desc = 'find_files' },
		{ '<leader>b', '<cmd>Telescope buffers<cr>', desc = 'buffers' },
		{ '<leader>fa', '<cmd>Telescope live_grep<cr>', desc = 'live_grep' },
		{ '<leader>fch', '<cmd>Telescope command_history<cr>', desc = 'command_history' },
		{ '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'diagnostics' },
		{ '<leader>fg', '<cmd>Telescope git_files<cr>', desc = 'git_files' },
		{ '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'help_tags' },
		{ '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'keymaps' },
		{ '<leader>fo', '<cmd>Telescope oldfiles<cr>', desc = 'oldfiles' },
		{ '<leader>fw', '<cmd>Telescope grep_string<cr>', mode = { 'n', 'v' }, desc = 'grep_string' },
		{ '<leader>gb', '<cmd>Telescope git_branches<cr>', desc = 'git_branches' },
		{ '<leader>gbb', '<cmd>Telescope git_bcommits<cr>', desc = 'git_bcommits' },
		{ '<leader>gc', '<cmd>Telescope git_commits<cr>', desc = 'git_commits' },
		{ '<leader>gs', '<cmd>Telescope git_status<cr>', desc = 'git_status' },
		{ '<leader>gst', '<cmd>Telescope git_stash<cr>', desc = 'git_stash' },
		{ '<leader>man', '<cmd>Telescope man_pages<cr>', desc = 'man_pages' },
	},
	config = function()
		local telescope = require('telescope')

		telescope.setup({
			defaults = {
				entry_prefix = '  ',
				prompt_prefix = '   ',
				selection_caret = '  ',
			},
			pickers = {
				git_files = { show_untracked = true },
			},
		})

		telescope.load_extension('fzf')
		telescope.load_extension('neoclip')
		telescope.load_extension('smart_open')
	end,
}
