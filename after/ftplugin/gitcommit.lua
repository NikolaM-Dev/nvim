local bmap = require('lib').bmap

vim.opt_local.spell = true

bmap('n', '<C-s>', '<cmd>wq<cr>', { desc = 'Write and Quit buffer' })
bmap({ 'i', 'x' }, '<C-s>', '<esc><cmd>wq<cr>', { desc = 'Write and Quite buffer' })
