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
		{ '<leader>fc', function() Snacks.picker.files({ title =  '  eovim Files ', cwd = vim.fn.stdpath('config') }) end, desc = '[F]ind [C]onfig Files' },
		{ '<leader>ff', function() Snacks.picker.files({ hidden = true }) end, desc = '[F]ind [F]iles' },
		{ '<leader>fg', function() Snacks.picker.git_files() end, desc = '[F]ind [G]it Files' },
		{ '<leader>fp', function() Snacks.picker.projects() end, desc = '[F]ind [P]rojects' },
		{ '<leader>fr', function() Snacks.picker.recent() end, desc = '[F]ind [R]ecent' },

		{ '<leader>.', function() Snacks.scratch() end, desc = 'Toggle [S]cratch Buffer' },
		{ '<leader>n', function() Snacks.picker.notifications() end, desc = '[N]otification History' },

		-- search
		{ '<leader>sH', function() Snacks.picker.highlights() end, desc = '[S]earch [H]ighlights' },
		{ '<leader>sc', function() Snacks.picker.commands() end,   desc = '[S]earch [C]ommands' },
		{ '<leader>sh', function() Snacks.picker.help() end,       desc = '[S]earch [H]elp Pages' },
		{ '<leader>si', function() Snacks.picker.icons() end,      desc = '[S]earch [I]cons' },
		{ '<leader>sk', function() Snacks.picker.keymaps() end,    desc = '[S]earch [K]eymaps' },
		{ '<leader>ss', function() Snacks.picker() end,            desc = '[S]earch [S]nacks pickers' },

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

		-- zen
		{ '<leader>z', function() Snacks.zen() end, desc = 'Toggle [Z]en Mode' },

		-- zoom
		{ '<leader>Z', function() Snacks.zen.zoom() end, desc = 'Toggle [Z]oom' },
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

			---@type snacks.input.Config
			---@diagnostic disable-next-line: missing-fields
			input = {
				icon = '',
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
