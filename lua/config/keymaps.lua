local map = require('lib').map
local dmap = require('lib').dmap

vim.g.mapleader = ' '

dmap({ 'i', 's' }, '<C-s>')
map('n', '<C-s>', '<cmd>write<cr>', { desc = 'Write buffer' })
map({ 'i', 'x' }, '<C-s>', '<esc><cmd>write<cr>', { desc = 'Write buffer' })

	return vim.keymap.set(mode, lhs, rhs, opts)
end
map('i', '!', '!<c-g>u', { desc = 'Add undo break after type !' })
map('i', ',', ',<c-g>u', { desc = 'Add undo break after type ,' })
map('i', '-', '-<c-g>u', { desc = 'Add undo break after type -' })
map('i', '.', '.<c-g>u', { desc = 'Add undo break after type .' })
map('i', ';', ';<c-g>u', { desc = 'Add undo break after type ;' })
map('i', '?', '?<c-g>u', { desc = 'Add undo break after type ?' })
map('i', '_', '_<c-g>u', { desc = 'Add undo break after type _' })
map('n', 'o', 'o<c-g>u', { desc = 'Add undo break after type o' })
