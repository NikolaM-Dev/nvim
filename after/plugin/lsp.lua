local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local opts = keymap.new_opts
local silent, noremap = keymap.silent, keymap.noremap

nmap({
	{ '<Leader>li', cmd('LspInfo'), opts(noremap, silent) },
	{ '<Leader>ll', cmd('LspLog'), opts(noremap, silent) },
	{ '<Leader>lr', cmd('LspRestart'), opts(noremap, silent) },
})
