vim.opt_local.spell = true

vim.keymap.set({ 'i', 'n', 's', 'v' }, '<C-s>', '<esc><cmd>wq<cr>', { desc = 'Write and Quit buffer' })
