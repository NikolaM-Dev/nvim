---@module 'lazy.types'
---@type LazySpec
return {
	'folke/which-key.nvim',
	desc = 'WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type',
	enabled = true,

	event = 'VeryLazy',

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
	},
}
