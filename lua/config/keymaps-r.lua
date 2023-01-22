local function keymap(mode, lhs, rhs, opts)
	local keys = require('lazy.core.handler').handlers.keys
	-- do not create the keymap if a lazy keys handler exists
	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

local util = require('util')

-- Insert --
-- Add undo break-points
keymap('i', ',', ',<c-g>u')
keymap('i', '.', '.<c-g>u')
keymap('i', ';', ';<c-g>u')

-- Home row navigation
keymap('i', '<C-h>', '<left>', { desc = 'Move Cursor Left' })
keymap('i', '<C-l>', '<right>', { desc = 'Move Cursor Right' })
keymap('i', '<C-j>', '<down>', { desc = 'Move Cursor Down' })
keymap('i', '<C-k>', '<up>', { desc = 'Move Cursor Up' })

-- Normal --
-- movement between buffers
keymap('n', '<s-tab>', function()
	vim.cmd('bn')
end, { desc = 'Buffer Next' })
keymap('n', '<tab>', '<C-w>w', { desc = 'Next window' })

-- Remap for dealing with word wrap
keymap('n', 'k', 'v:count == 0 ? \'gk\' : \'k\'', { expr = true, silent = true })
keymap('n', 'j', 'v:count == 0 ? \'gj\' : \'j\'', { expr = true, silent = true })

-- Enter inserts newline without leaving Normal mode
-- Need to change keys in windows terminal https://github.com/microsoft/terminal/issues/530#issuecomment-892247092
keymap('n', '<cr>', 'm`o<Esc>``', { desc = 'Insert Newline Below' })
keymap('n', '<s-cr>', 'm`O<Esc>``', { desc = 'Insert Newline Above' })

-- change word with <c-c>
keymap('n', '<C-c>', '<cmd>normal! ciw<cr>a', { desc = 'Change Inner Word' })

-- H and L go to begining/end of line
keymap('n', 'H', '^', { desc = 'Go to Beginning of Line' })
keymap('n', 'L', '$', { desc = 'Go to End of Line' })

-- Keep cursor in place when joining lines
keymap('n', 'J', 'm`J``', { desc = 'Keep Cursor in Place When Joining Lines' })

-- Center cursor when scrolling page
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Scroll Down and Center Page' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Scroll Up and Center Page' })

-- Keep search term in the middle of screen
keymap('n', 'n', 'nzzzv', { desc = 'Next Search Item' })
keymap('n', 'N', 'Nzzzv', { desc = 'Previous Search Item' })

-- Select whole line
keymap('n', 'vv', 'V', { desc = 'Select Whole Line' })

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv^', { desc = 'Shift Selection Left' })
keymap('v', '>', '>gv^', { desc = 'Shift Selection Right' })

-- Better paste
keymap('v', 'p', '"_dP', { desc = 'Paste Over Selection' })

-- Open link under cursor
keymap(
	'',
	'gx',
	'<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>',
	{ desc = 'Open Link Under Cursor' }
)

-- Send deletions to blackhole register
for _, lhs in ipairs({ 'c', 'C', 'd', 'D', 'x', 'X' }) do
	keymap({ 'n', 'x' }, lhs, '"_' .. lhs, { desc = 'which_key_ignore' })
end

-- Map "d" cut action to cut key
local cut_key = '<M-d>'

keymap({ 'n', 'x' }, cut_key, 'd', { desc = 'Cut Operator' })
keymap('n', cut_key .. cut_key, 'dd', { desc = 'Cut Line' })
keymap('n', string.upper(cut_key), 'D', { desc = 'Cut To EOL' })
--
-- Clear search with <esc>
keymap({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and Clear Hlsearch' })

-- Search word under cursor
keymap({ 'n', 'x' }, 'gw', '*N', { desc = 'Search Current Word' })

-- Leader Mappings
-- Lazygit
keymap('n', '<leader>gg', function()
	require('util').open_term('lazygit', { direction = 'float' })
end, { desc = 'Lazygit' })

-- Splits
keymap('n', '<leader>-', '<cmd>split<CR>', { desc = 'Split' })
keymap('n', '<leader>\\', '<cmd>vsplit<CR>', { desc = 'VSplit' })

-- Core file commands
keymap('n', '<leader>fe', '<cmd>enew<CR>', { desc = 'New File' })
keymap('n', '<leader>q', '<cmd>q!<CR>', { desc = 'Quit' })
keymap('n', '<leader>w', '<cmd>w!<CR>', { desc = 'Save' })

-- Lazy
keymap('n', '<leader>l', '<cmd>:Lazy<CR>', { desc = 'Lazy' })
keymap('n', '<leader>sS', function()
	require('util').so_input()
end, { desc = 'StackOverflow' })

-- UI Toggles
keymap('n', '<leader>uc', function()
	local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
	util.toggle('conceallevel', false, { 0, conceallevel })
end, { desc = 'Toggle Conceal' })

keymap('n', '<leader>uz', function()
	util.toggle('foldcolumn', false, { '0', '1' })
end, { desc = 'Toggle Foldcolumn' })

keymap('n', '<leader>ul', function()
	util.toggle('relativenumber', true)
	util.toggle('number')
end, { desc = 'Toggle Line Number ' })
keymap('n', '<leader>us', function()
	util.toggle('spell')
end, { desc = 'Toggle Spell' })
keymap('n', '<leader>uw', function()
	util.toggle('wrap')
end, { desc = 'Toggle Word Wrap' })
keymap('n', '<leader>uf', require('plugins.lsp.format').toggle, { desc = 'Toggle Format on Save' })
keymap('n', '<leader>ud', function()
	util.toggle_diagnostics()
end, { desc = 'Toggle Diagnostics' })

-- highlights under cursor
keymap('n', '<leader>sH', vim.show_pos, { desc = 'Highlight Groups' })
