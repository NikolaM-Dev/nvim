---@module 'lazy'
---@type LazySpec
return {
	'Wansmer/treesj',
	desc = 'Neovim plugin for splitting/joining blocks of code',
	enabled = true,

	keys = {
		{ '<leader>j', '<cmd>TSJToggle<cr>', desc = 'Toggle node under cursor' },
	},

	---@type table
	opts = {
		use_default_keymaps = false,
	},
}
