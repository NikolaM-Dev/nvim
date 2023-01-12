local status_ok, lspsaga = pcall(require, 'lspsaga')
if not status_ok then
	return
end

local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local noremap, silent = keymap.noremap, keymap.silent
local opts = keymap.new_opts

lspsaga.setup({
	code_action = {
		num_shortcut = true,
		keys = {
			quit = 'q',
			exec = '<CR>',
		},
	},
	lightbulb = {
		enable = true,
		enable_in_insert = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	diagnostic = {
		twice_into = false,
		show_code_action = true,
		show_source = true,
		keys = {
			exec_action = 'o',
			quit = 'q',
			go_action = 'g',
		},
	},
	rename = {
		quit = '<C-c>',
		exec = '<CR>',
		in_select = true,
	},
	symbol_in_winbar = {
		enable = false,
		separator = ' ',
		show_file = true,
		folder_level = 1,
	},
	-- show outline
	show_outline = {
		win_position = 'right',
		--set special filetype win that outline window split.like NvimTree neotree
		-- defx, db_ui
		win_with = '',
		win_width = 30,
		auto_enter = true,
		auto_preview = true,
		virt_text = '┃',
		jump_key = 'o',
		-- auto refresh when change buffer
		auto_refresh = true,
	},
})

nmap({
	{ 'ga', cmd('Lspsaga code_action'), opts(noremap, silent) },
	{ 'gd', cmd('Lspsaga goto_definition'), opts(noremap, silent) },
	{ 'gh', cmd('Lspsaga lsp_finder'), opts(noremap, silent) },
	{ 'gr', cmd('Lspsaga rename'), opts(noremap, silent) },
	{ '<leader>dj', cmd('Lspsaga diagnostic_jump_next'), opts(noremap, silent) },
	{ '<leader>dk', cmd('Lspsaga diagnostic_jump_prev'), opts(noremap, silent) },
})

vim.keymap.set({ 'n', 't' }, '<A-d>', cmd('Lspsaga term_toggle'))
