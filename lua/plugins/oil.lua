---@module 'lazy'
---@type LazySpec
return {
	'stevearc/oil.nvim',
	desc = 'Neovim file explorer: edit your filesystem like a buffer',
	enabled = true,

	lazy = false,
	keys = {
		{ '-', '<cmd>Oil<cr>' },
		{ '<backspace>-', '<cmd>Oil .<cr>' },
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
			['<C-l>'] = false, -- disable refresh
			['<backspace><C-v>'] = { 'actions.select', opts = { vertical = true } },
			['<backspace><C-x>'] = { 'actions.select', opts = { horizontal = true } },
			['gr'] = 'actions.refresh',
			['<C-s>'] = {
				callback = function()
					require('oil').save()
				end,
				desc = '[S]ave all changes',
				mode = { 'i', 'n', 'v' },
			},
		},

		view_options = {
			is_hidden_file = function(filename)
				local filters = { '^.git$', '^node_modules$' } -- '^dist$', '^.obsidian$'
				local is_in_filters = vim.fn.match(filters, filename) ~= -1

				return is_in_filters
			end,

			is_always_hidden = function(name)
				return name == '..'
			end,
		},
	},
}
