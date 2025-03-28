local enabled = { enabled = true }

---@type LazySpec
return {
	'folke/snacks.nvim',
	enabled = true,

	priority = 1000,
	lazy = false,

	keys = function()
		local snacks = require('snacks')

		return {
			-- stylua: ignore start
			-- buffers
			{ '<leader>bd', function() snacks.bufdelete() end, desc = '[D]elete [B]uffer' },

			-- git
			{ '<leader>gS', function() snacks.picker.git_stash() end, desc = '[G]it [S]tash' },
			{ '<leader>gs', function() snacks.picker.git_status() end, desc = '[G]it [S]tatus' },
			-- stylua: ignore end
		}
	end,

	---@type snacks.Config
	opts = {
		bigfile = enabled,
		bufdelete = enabled,
		quickfile = enabled,
		dashboard = {
			preset = {
				header = 'Be a high performance person, being all that you can be every day 24/7, 365',
				keys = {
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
	},
}
