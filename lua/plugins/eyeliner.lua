---@module 'lazy.types'
---@type LazySpec
return {
	'jinh0/eyeliner.nvim',
	---@see lua/plugins/clever_f.lua
	desc = '👀 Move faster with unique f/F indicators.',
	enabled = true,

	opts = {
		default_keymaps = false,
		dim = true,
		highlight_on_key = true,
	},
}
