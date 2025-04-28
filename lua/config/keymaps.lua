local map = require('lib').map
local dmap = require('lib').dmap

-- TODO: :silent mkspell! %, to generate spell files

vim.g.mapleader = ' '

dmap({ 'i', 's' }, '<C-s>')
map('n', '<C-s>', '<cmd>write<cr>', { desc = 'Write buffer' })
map('n', '<leader><C-s>', '<cmd>wall<cr>', { desc = 'Write All changed buffers' })
map({ 'i', 'x' }, '<C-s>', '<esc><cmd>write<cr>', { desc = 'Write buffer' })

map('n', '<leader>lg', function()
	vim.fn.system('tmux new-window -c "#{pane_current_path}" -n "   " lazygit')
end, { desc = '[L]azy [G]it using Tmux' })

map('n', '<leader>ld', function()
	vim.fn.system('tmux new-window -c "#{pane_current_path}" -n "   " lazydocker')
end, { desc = '[L]azy [D]ocker using Tmux' })

map('n', '<C-q>', function()
	-- Close gitsigns diffthis buffer
	if is_in_gitsigns_diffthis then
		vim.cmd('wincmd p')
		_G.is_in_gitsigns_diffthis = false
	end

	vim.cmd.quit()
end, { desc = '[Q]uit' })
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

map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

map('x', '<leader>sl', ':sort<cr>', { desc = '[S]ort [L]ines' })

map({ 'n', 'v', 'o' }, '<C-z>', '<Nop>', { desc = 'Disable <C-z> suspend' })

map('n', 'j', function()
	return vim.v.count > 1 and 'j' or 'gj'
end, { expr = true, desc = 'Go down dwim' })

map('n', 'k', function()
	return vim.v.count > 0 and 'k' or 'gk'
end, { expr = true, desc = 'Go up dwim' })
