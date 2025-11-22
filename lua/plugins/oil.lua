function _G.custom_oil_winbar()
	local path = vim.fn.expand('%')
	path = path:gsub('oil://', '')

	return vim.fn.fnamemodify(path, ':.')
end

---@module 'lazy.types'
---@type LazySpec
return {
	'stevearc/oil.nvim',
	desc = 'Neovim file explorer: edit your filesystem like a buffer',
	enabled = true,

	lazy = false,
	keys = {
		{ '-', '<cmd>Oil<cr>', desc = 'Open Oil' },
		{ '<leader>-', '<cmd>Oil .<cr>', desc = 'Open Oil (cwd)' },
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
				local filters = {
					-- common
					'^.git$',
					'^node_modules$',
					-- '^dist$', '^.obsidian$',

					-- debug
					'DAP *',
					'[dap-repl-*',
				}
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

		win_options = {
			winbar = ' %#OilDir#󰝰 %#OilFile#%{v:lua.custom_oil_winbar()}',
		},
	},
}
