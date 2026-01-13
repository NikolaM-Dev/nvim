---@module 'lazy.types'
---@type LazySpec
return {
	'dmtrKovalenko/fff.nvim',
	desc = 'Finally a Fast Fuzzy File Finder for neovim',
	enabled = true,
	lazy = false,

	build = 'cargo build --release',

	keys = {
		-- stylua: ignore start
		{ '<leader>ff', function() require('fff').find_files() end, desc = '[F][F]Files' },
		-- stylua: ignore end
	},

	---@type table
	opts = {
		lazy_sync = false,
		max_threads = 10,
		prompt = '   ',

		layout = {
			height = 0.85,
			preview_position = 'right',
			preview_size = 0.6,
			prompt_position = 'top',
			width = 0.85,
		},
		keymaps = {
			close = '<Esc>',
			select = '<CR>',
			select_split = '<C-s>',
			select_vsplit = '<C-v>',
			select_tab = '<C-t>',
			move_up = { '<Up>', '<C-p>', '<C-k>' },
			move_down = { '<Down>', '<C-n>', '<C-j>' },
			preview_scroll_up = '<C-u>',
			preview_scroll_down = '<C-d>',
			toggle_debug = '<F2>',
		},
	},

	---@param opts table
	config = function(_, opts)
		require('fff').setup(opts)

		vim.api.nvim_create_autocmd({
			'BufDelete',
			'BufEnter',
			'BufNewFile',
			'BufReadPost',
			'BufWipeout',
			'BufWritePost',
			'FocusGained',
		}, {
			command = 'FFFScan',
			desc = 'Index New Files',
			group = nkl.augroup('index_new_files'),
		})
	end,
}
