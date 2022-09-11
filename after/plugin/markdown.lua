local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local noremap = keymap.noremap
local opts = keymap.new_opts

vim.cmd([[ 
" use a custom port to start server or empty for random
let g:mkdp_port = '5000'

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'dark'
]])

nmap({ '<leader>md', cmd('MarkdownPreviewToggle'), opts(noremap) })
