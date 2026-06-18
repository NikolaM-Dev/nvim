---@module 'lazy.types'
---@type LazySpec
return {
	{
		'tpope/vim-dadbod',
		desc = 'dadbod.vim: Modern database interface for Vim',
		enabled = true,
	},
	{
		'kristijanhusak/vim-dadbod-ui',
		desc = 'Simple UI for https://github.com/tpope/vim-dadbod',
		enabled = true,

		cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },

		keys = {
			{ '<leader><leader>db', '<cmd>DBUIToggle<cr>' },
		},

		init = function()
			vim.g.db_ui_show_database_icon = 1
			vim.g.db_ui_show_help = 0
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_use_nvim_notify = 1
			vim.g.db_ui_winwidth = math.floor(vim.o.columns * 0.2)

			local data_path = vim.fn.stdpath('data')
			vim.g.db_ui_save_location = data_path .. '/dadbod_ui'
			vim.g.db_ui_tmp_query_location = data_path .. '/dadbod_ui/tmp'

			local expanded_icon = '▾'
			local collapsed_icon = '▸'
			vim.g.db_ui_icons = {
				expanded = {
					db = expanded_icon .. ' 󱙋',
					buffers = expanded_icon .. ' ',
					saved_queries = expanded_icon .. ' 󱋣',
					schemas = expanded_icon .. ' ',
					schema = expanded_icon .. ' 󰙅',
					tables = expanded_icon .. ' 󰓱',
					table = expanded_icon .. ' ',
				},
				collapsed = {
					db = collapsed_icon .. ' 󱙋',
					buffers = collapsed_icon .. ' ',
					saved_queries = collapsed_icon .. ' 󱋣',
					schemas = collapsed_icon .. ' ',
					schema = collapsed_icon .. ' 󰙅',
					tables = collapsed_icon .. ' 󰓱',
					table = collapsed_icon .. ' ',
				},
				saved_query = '  ',
				new_query = '  󰓰',
				tables = '  󰓫',
				buffers = '  ',
				add_connection = '  󰆺',
				connection_ok = '󰪩',
				connection_error = '󰴀',
			}
		end,
	},
