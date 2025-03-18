local map = vim.keymap.set

-- Navigation
-- TODO: Remove and use tmux plugin
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Add more undo `break-points`
map('i', '!', '!<C-g>u', { desc = 'Add undo break point after type `!`' })
map('i', ',', ',<C-g>u', { desc = 'Add undo break point after type `,`' })
map('i', '-', '-<C-g>u', { desc = 'Add undo break point after type `-`' })
map('i', '.', '.<C-g>u', { desc = 'Add undo break point after type `.`' })
map('i', ';', ';<C-g>u', { desc = 'Add undo break point after type `;`' })
map('i', '?', '?<C-g>u', { desc = 'Add undo break point after type `?`' })
map('i', '_', '_<C-g>u', { desc = 'Add undo break point after type `_`' })
map('n', 'o', 'o<C-g>u', { desc = 'Add undo break point after type `o`' })
