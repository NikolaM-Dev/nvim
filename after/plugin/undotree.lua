local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local noremap = keymap.noremap
local opts = keymap.new_opts

nmap({ '<leader>u', cmd('UndotreeToggle'), opts(noremap) })
