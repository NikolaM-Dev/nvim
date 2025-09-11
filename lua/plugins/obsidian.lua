---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'obsidian-nvim/obsidian.nvim',
	desc = 'Obsidian 🤝 Neovim',
	enabled = true,

	ft = 'markdown',

	cmd = { 'Obsidian' },

	keys = {
		{ '<leader>o', '<cmd>Obsidian<cr>', desc = '[O]bsidian' },
	},

	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false,

		checkbox = {
			order = {
				' ', -- In progress
				'x', -- Done
				'-', -- Canceled
			},
		},

		completion = {
			blink = false,
			min_chars = 0,
			nvim_cmp = false,
		},

		daily_notes = {
			folder = 'Journal/daily',
		},

		note_id_func = function()
			-- [Denote - The file-naming scheme](https://protesilaos.com/emacs/denote#h:4e9c7512-84dc-4dfb-9fa9-e15d51178e5d)
			return tostring(os.date('%Y%m%dT%H%M%S'))
		end,

		picker = {
			name = 'snacks.pick',
		},

		workspaces = {
			{ name = 'second-brain.md', path = os.getenv('SECOND_BRAIN_PATH') .. '/src' },
		},

		ui = {
			enable = false, -- Becase the manteiner are going to deprecate this module
		},
	},

	---@module 'obsidian'
	---@param opts obsidian.config.ClientOpts
	config = function(_, opts)
		require('obsidian').setup(opts)
	end,
}
