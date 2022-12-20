local status_ok, lspsaga = pcall(require, 'lspsaga')
if not status_ok then
	return
end

local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local noremap, silent = keymap.noremap, keymap.silent
local opts = keymap.new_opts

lspsaga.init_lsp_saga({
	-- Options with default value
	-- "single" | "double" | "rounded" | "bold" | "plus"
	border_style = 'rounded',
	--the range of 0 for fully opaque window (disabled) to 100 for fully
	--transparent background. Values between 0-30 are typically most useful.
	saga_winblend = 0,
	-- when cursor in saga window you config these to move
	move_in_saga = { prev = '<C-p>', next = '<C-n>' },
	-- Error, Warn, Info, Hint
	-- use emoji like
	-- { "🙀", "😿", "😾", "😺" }
	-- or
	-- { "😡", "😥", "😤", "😐" }
	-- and diagnostic_header can be a function type
	-- must return a string and when diagnostic_header
	-- is function type it will have a param `entry`
	-- entry is a table type has these filed
	-- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
	diagnostic_header = { ' ', ' ', ' ', 'ﴞ ' },
	-- preview lines of lsp_finder and definition preview
	max_preview_lines = 10,
	-- use emoji lightbulb in default
	code_action_icon = '💡',
	-- if true can press number to execute the codeaction in codeaction window
	code_action_num_shortcut = true,
	-- same as nvim-lightbulb but async
	code_action_lightbulb = {
		enable = true,
		enable_in_insert = true,
		cache_code_action = true,
		sign = false,
		update_time = 150,
		sign_priority = 20,
		virtual_text = true,
	},
	-- finder icons
	finder_icons = {
		def = '  ',
		ref = '諭 ',
		link = '  ',
	},
	-- finder do lsp request timeout
	-- if your project big enough or your server very slow
	-- you may need to increase this value
	finder_request_timeout = 1500,
	finder_action_keys = {
		open = 'o',
		vsplit = 's',
		split = 'i',
		tabe = 't',
		quit = 'q',
	},
	code_action_keys = {
		quit = 'q',
		exec = '<CR>',
	},
	definition_action_keys = {
		edit = '<C-c>o',
		vsplit = '<C-c>v',
		split = '<C-c>i',
		tabe = '<C-c>t',
		quit = 'q',
	},
	rename_action_quit = '<C-c>',
	rename_in_select = false,
	-- show symbols in winbar must nightly
	symbol_in_winbar = {
		in_custom = true,
		enable = true,
		separator = ' ',
		show_file = true,
		click_support = false,
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
	-- custom lsp kind
	-- usage { Field = 'color code'} or {Field = {your icon, your color code}}
	custom_kind = {},
	-- if you don't use nvim-lspconfig you must pass your server name and
	-- the related filetypes into this table
	-- like server_filetype_map = { metals = { "sbt", "scala" } }
	server_filetype_map = {},
})

nmap({
	{ 'ga', cmd('Lspsaga code_action'), opts(noremap, silent) },
	{ 'gh', cmd('Lspsaga lsp_finder'), opts(noremap, silent) },
	{ 'gr', cmd('Lspsaga rename'), opts(noremap, silent) },
	{ '<leader>dj', cmd('Lspsaga diagnostic_jump_next'), opts(noremap, silent) },
	{ '<leader>dk', cmd('Lspsaga diagnostic_jump_prev'), opts(noremap, silent) },
	{ '<Leader>o', cmd('LSoutlineToggle'), opts(noremap, silent) },
})
