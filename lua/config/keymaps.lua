local map = require('lib').map
vim.g.mapleader = ' '


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
