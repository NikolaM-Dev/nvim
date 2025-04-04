---@module 'lazy'
---@type LazySpec
return {
	'folke/snacks.nvim',
	desc = 'A collection of QoL plugins for Neovim',
	enabled = true,

	priority = 1000,
	lazy = false,

	keys = {
		-- stylua: ignore start
		-- find
		{ '<leader><space>', function() Snacks.picker.smart() end, desc = 'Smart Find Files' },
		{ '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Buffers' },
		{ '<leader>fc', function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, desc = 'Find Config File' },
		{ '<leader>ff', function() Snacks.picker.files() end, desc = 'Find Files' },
		{ '<leader>fg', function() Snacks.picker.git_files() end, desc = 'Find Git Files' },
		{ '<leader>fp', function() Snacks.picker.projects() end, desc = 'Projects' },
		{ '<leader>fr', function() Snacks.picker.recent() end, desc = 'Recent' },

		-- search
		{ '<leader>sh', function() Snacks.picker.help() end, desc = '[H]elp Pages' },
		{ '<leader>sH', function() Snacks.picker.highlights() end, desc = 'Highlights' },
		{ '<leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
		{ '<leader>si', function() Snacks.picker.icons() end, desc = '[S]earch [I]cons' },

		-- grep
		{ '<leader>sb', function() Snacks.picker.lines() end, desc = 'Buffer Lines' },
		{ '<leader>sB', function() Snacks.picker.grep_buffers() end, desc = 'Grep Open Buffers' },
		{ '<leader>sg', function() Snacks.picker.grep() end, desc = 'Grep' },
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
			picker = enabled,
			quickfile = enabled,
			toggle = enabled,
			rename = enabled,

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
