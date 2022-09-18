local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local noremap = keymap.noremap
local opts = keymap.new_opts

vim.g.mkdp_port = '5000'
vim.g.mkdp_theme = 'dark'

nmap({ '<leader>md', cmd('MarkdownPreviewToggle'), opts(noremap) })
