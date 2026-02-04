---@diagnostic disable: missing-fields

---@module 'lazy.types'
---@type LazySpec
return {
	'sudo-tee/opencode.nvim',
	desc = 'neovim frontend for opencode - a terminal-based AI coding agent',
	name = 'opencode_frontend',
	event = 'VeryLazy',

	dependencies = {
		'MeanderingProgrammer/render-markdown.nvim',
		'nvim-lua/plenary.nvim',
		'saghen/blink.cmp',
	},

	---@module 'opencode'
	---@type OpencodeConfig
	opts = {
		keymap_prefix = '<leader>a',
		prefered_picker = 'snacks',

		keymap = {
			editor = {
				['<C-.>'] = { 'toggle' },
			},
			input_window = {
				['<cr>'] = { 'submit_input_prompt', { 'n' } },
			},
		},
	},
}
