local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local opts = keymap.new_opts
local silent, noremap = keymap.silent, keymap.noremap

nmap({
	{ '<Leader>ps', cmd('PackerSync'), opts(noremap, silent) },
})
