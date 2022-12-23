local ok, harpoon = pcall(require, 'harpoon')
if not ok then
	return
end

local keymap = require('core.keymap')

local nmap = keymap.nmap
local opts = keymap.new_opts
local silent = keymap.silent

harpoon.setup({
	-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
	save_on_toggle = false,

	-- saves the harpoon file upon every change. disabling is unrecommended.
	save_on_change = true,

	-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
	enter_on_sendcmd = false,

	-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
	tmux_autoclose_windows = false,

	-- filetypes that you want to prevent from adding to the harpoon list menu.
	excluded_filetypes = { 'harpoon' },

	-- set marks specific to each git branch inside git repository
	mark_branch = false,
})

nmap({
	{
		'<leader>a',
		function()
			require('harpoon.mark').add_file()
		end,
		opts(silent),
	},
	{
		'<C-e>',
		function()
			require('harpoon.ui').toggle_quick_menu()
		end,
		opts(silent),
	},
})

for i = 1, 5 do
	nmap({
		string.format('<leader>%s', i),
		function()
			require('harpoon.ui').nav_file(i)
		end,
		opts(silent),
	})
end
