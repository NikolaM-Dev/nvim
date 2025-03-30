---@module 'lazy'
---@type LazySpec
return {
	'stevearc/oil.nvim',
	desc = 'Neovim file explorer: edit your filesystem like a buffer',
	enabled = true,

	lazy = false,
	keys = {
		{ '-', '<cmd>Oil<cr>' },
	},

	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		delete_to_trash = true,
		prompt_save_on_select_new_entry = false,
		skip_confirm_for_simple_edits = true,
		watch_for_changes = true,

		keymaps = {
			['<C-h>'] = false, -- disable horizontal split
			['<leader><C-v>'] = { 'actions.select', opts = { vertical = true } },
			['<leader><C-x>'] = { 'actions.select', opts = { horizontal = true } },
			['<C-s>'] = {
				callback = function()
					require('oil').save()
				end,
				desc = '[S]ave all changes',
				mode = { 'i', 'n', 'v' },
			},
		},
	},
}
