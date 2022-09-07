local ok, harpoon = pcall(require, 'harpoon')
if not ok then
	return
end

local keymap = require('core.keymap')

local nmap = keymap.nmap
local opts = keymap.new_opts
local silent = keymap.silent

harpoon.setup()

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
