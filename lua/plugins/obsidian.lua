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

		daily_notes = {
			folder = 'Journal/daily',
		},

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
