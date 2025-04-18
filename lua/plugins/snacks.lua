---@module 'lazy'
---@type LazySpec
return {
	'folke/snacks.nvim',
	desc = 'A collection of QoL plugins for Neovim',
	enabled = true,

	priority = 1000,
	lazy = false,

	keys = {
		-- find
		-- stylua: ignore start
		{ '<leader>fb', function() Snacks.picker.buffers() end, desc = '[F]ind [B]uffers' },
		{ '<leader>fc', function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, desc = '[F]ind [C]onfig Files' },
		{ '<leader>ff', function() Snacks.picker.files({ hidden = true }) end, desc = '[F]ind [F]iles' },
		{ '<leader>fg', function() Snacks.picker.git_files() end, desc = '[F]ind [G]it Files' },
		{ '<leader>fp', function() Snacks.picker.projects() end, desc = '[F]ind [P]rojects' },
		{ '<leader>fr', function() Snacks.picker.recent() end, desc = '[F]ind [R]ecent' },

		{ '<leader>.', function() Snacks.scratch() end, desc = 'Toggle [S]cratch Buffer' },
		{ '<leader>n', function() Snacks.picker.notifications() end, desc = '[N]otification History' },

		-- search
		{ '<leader>sh', function() Snacks.picker.help() end, desc = 'Search [H]elp Pages' },
		{ '<leader>ss', function() Snacks.picker() end, desc = '[S]earch [S]nacks pickers' },
		{ '<leader>sH', function() Snacks.picker.highlights() end, desc = '[S]earch [H]ighlights' },
		{ '<leader>sk', function() Snacks.picker.keymaps() end, desc = '[S]earch [K]eymaps' },
		{ '<leader>si', function() Snacks.picker.icons() end, desc = '[S]earch [I]cons' },

		-- grep
		{ '<leader>sb', function() Snacks.picker.lines() end, desc = '[S]earch [B]uffer Lines' },
		{ '<leader>sB', function() Snacks.picker.grep_buffers() end, desc = 'Grep Open Buffers' },
		{ '<leader>sg', function() Snacks.picker.grep() end, desc = '[S]each [G]rep' },
		{ '<leader>sw', function() Snacks.picker.grep_word() end, desc = 'Visual selection or word', mode = { 'n', 'x' } },

		-- buffers
		{ '<leader>bd', function() Snacks.bufdelete() end, desc = '[D]elete [B]uffer', },

		-- git
		{ '<leader>gS', function() Snacks.picker.git_stash() end, desc = '[G]it [S]tash' },
		{ '<leader>gs', function() Snacks.picker.git_status() end, desc = '[G]it [S]tatus' },
		-- stylua: ignore end
	},

	opts = function()
		local enabled = { enabled = true }

		---@module 'snacks'
		---@type snacks.Config
		return {
			bigfile = enabled,
			bufdelete = enabled,
			notifier = enabled,
			quickfile = enabled,
			rename = enabled,
			scratch = enabled,
			statuscolumn = enabled,
			toggle = enabled,

			dashboard = {
				preset = {
					header = 'Be a high performance person, being all that you can be every day 24/7, 365',
					keys = {
						{ icon = '󰒲 ', key = 'l', desc = '[L]azy', action = ':Lazy' },
						{ icon = ' ', key = 's', desc = 'Restore [S]ession', section = 'session' },
						{ icon = ' ', key = 'q', desc = '[Q]uit', action = ':qa' },
					},
				},
				sections = {
					{ section = 'header' },
					{ icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
					{ section = 'startup' },
				},
			},

			picker = {
				win = {
					input = {
						keys = {
							['<C-u>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
							['<C-d>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
						},
					},
				},
			},

			zen = {
				toggles = {
					dim = false,
				},
			},
		}
	end,

	config = function(_, opts)
		require('snacks').setup(opts)

		Snacks.toggle.zen():map('<leader>uz')
	end,
}
