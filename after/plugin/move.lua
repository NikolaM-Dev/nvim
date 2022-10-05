local keymap = require('core.keymap')

local nmap, vmap = keymap.nmap, keymap.vmap
local noremap, silent = keymap.noremap, keymap.silent
local opts = keymap.new_opts

nmap({
	{ '<A-H>', ':MoveHChar(-1)<CR>', opts(noremap, silent) },
	{ '<A-J>', ':MoveLine(1)<CR>', opts(noremap, silent) },
	{ '<A-K>', ':MoveLine(-1)<CR>', opts(noremap, silent) },
	{ '<A-L>', ':MoveHChar(1)<CR>', opts(noremap, silent) },
})

vmap({
	{ '<A-H>', ':MoveHChar(-1)<CR>', opts(noremap, silent) },
	{ '<A-J>', ':MoveLine(1)<CR>', opts(noremap, silent) },
	{ '<A-K>', ':MoveLine(-1)<CR>', opts(noremap, silent) },
	{ '<A-L>', ':MoveHChar(1)<CR>', opts(noremap, silent) },
})
