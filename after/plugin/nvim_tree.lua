local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local opts = keymap.new_opts
local silent, noremap = keymap.silent, keymap.noremap

nmap({ '<leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) })
nmap({
	{ '<leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) },
	{ '<leader><leader>e', cmd('NvimTreeCollapse'), opts(noremap, silent) },
})
