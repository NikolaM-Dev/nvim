---@module 'lazy.types'
---@type LazyPluginSpec
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
			['<leader><C-v>'] = { 'actions.select', opts = { vertical = true } },
			['<leader><C-x>'] = { 'actions.select', opts = { horizontal = true } },
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
				for _, pattern in ipairs(filters) do
					if vim.fn.match(filename, pattern) ~= -1 then
						return true
					end
				end

				return false
			end,

			is_always_hidden = function(name)
				return name == '..'
			end,
		},
	},
}
