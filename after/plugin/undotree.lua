local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local opts = keymap.new_opts
local noremap = keymap.noremap

nmap({ '<leader>u', cmd('UndotreeToggle'), opts(noremap) })
