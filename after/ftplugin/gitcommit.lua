vim.opt_local.spell = true

local bmap = nkl.key.bmap
bmap('n', '<C-s>', '<cmd>wq<cr>', { desc = 'Write and Quit buffer' })
bmap({ 'i', 'x' }, '<C-s>', '<esc><cmd>wq<cr>', { desc = 'Write and Quite buffer' })
