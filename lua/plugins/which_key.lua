---@module 'lazy.types'
---@type LazySpec
return {
	'folke/which-key.nvim',
	desc = 'WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type',
	enabled = true,

	event = 'VeryLazy',

	keys = {
		{
			'<leader>g?',
			function()
				require('which-key').show({ global = false })
			end,
			desc = '󰋖 Show buffer available keymaps',
		},
	},

	---@class wk.Opts
	opts = {
		delay = '400',
		preset = 'helix',
		spec = {
			{
				mode = { 'n', 'v' },
				{ '[', group = 'prev' },
				{ ']', group = 'next' },
			},
		},
		triggers = {
			{ 'tt', mode = { 'n' } },
			{ ']', mode = { 'n' } },
			{ '[', mode = { 'n' } },
			{ '<leader><leader>', mode = { 'n' } },
		},
	},
}
