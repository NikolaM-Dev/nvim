local map = require('lib').map
local dmap = require('lib').dmap

vim.g.mapleader = ' '

dmap({ 'i', 's' }, '<C-s>')
map('n', '<C-s>', '<cmd>write<cr>', { desc = 'Write buffer' })
map({ 'i', 'x' }, '<C-s>', '<esc><cmd>write<cr>', { desc = 'Write buffer' })

map('n', '<leader>lg', function()
	vim.fn.system('tmux new-window -c "#{pane_current_path}" -n "   " lazygit')
end, { desc = '[L]azy [G]it using Tmux' })

map('n', '<leader>ld', function()
	vim.fn.system('tmux new-window -c "#{pane_current_path}" -n "   " lazydocker')
end, { desc = '[L]azy [D]ocker using Tmux' })

map('i', '<C-q>', '<cmd>x<cr>', { desc = '[Q]uit' })

map('i', '!', '!<C-g>u', { desc = 'Add undo break after type !' })
map('i', ',', ',<C-g>u', { desc = 'Add undo break after type ,' })
map('i', '-', '-<C-g>u', { desc = 'Add undo break after type -' })
map('i', '.', '.<C-g>u', { desc = 'Add undo break after type .' })
map('i', ';', ';<C-g>u', { desc = 'Add undo break after type ;' })
map('i', '?', '?<C-g>u', { desc = 'Add undo break after type ?' })
map('i', '_', '_<C-g>u', { desc = 'Add undo break after type _' })
map('n', 'o', 'o<C-g>u', { desc = 'Add undo break after type o' })

map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up centralized' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down centralized' })

map('n', 'N', 'Nzzzv', { desc = 'Previous centralized' })
map('n', 'n', 'nzzzv', { desc = 'Next search centralized' })

map('n', '<C-o>', '<C-o>zz', { desc = 'Previous History centralized' })
map('n', '<C-i>', '<C-i>zz', { desc = 'Next History centralized' })
