local function map(mode, lhs, rhs, opts)
	local keys = require('lazy.core.handler').handlers.keys

	-- do not create the keymap if a lazy keys handler exists
	---@diagnostic disable-next-line: undefined-field
	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

-- Better up/down
map('n', 'k', 'v:count == 0 ? \'gk\' : \'k\'', { expr = true, silent = true })
map('n', 'j', 'v:count == 0 ? \'gj\' : \'j\'', { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- Resize window using <alt> hjkl keys
map('n', '<A-h>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<A-j>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<A-k>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<A-l>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Clear search with <esc>
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- Better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Sort
map('v', '<leader>s', ':!sort<cr>', { desc = 'Sort' })

-- Save
map({ 'i', 'n', 's', 'v' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Save all
map('n', '<leader>w', '<cmd>wall<cr>', { desc = 'Write all' })

-- Quit
map('n', '<C-q>', '<cmd>q<cr>', { desc = 'Quit' })

-- Close tab
map('n', '<leader>q', '<cmd>tabclose<cr>', { desc = 'Close tab' })

-- Quit & save
map('i', '<C-q>', '<esc><cmd>wq<cr>', { desc = 'Quit' })

-- Quit all
map('n', '<leader><leader>q', '<cmd>qall<cr>', { desc = 'Quit all' })

-- Quit without save
map('n', '<leader>z', '<cmd>q!<cr>', { desc = 'Quit without save' })

-- Centralized scroll
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up centralized' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down centralized' })

-- Centralized search
map('n', 'N', 'Nzzzv', { desc = 'Previous centralized' })
map('n', 'n', 'nzzzv', { desc = 'Next search centralized' })

-- Lazy
map('n', '<leader>lp', '<cmd>Lazy profile<cr>', { desc = 'Lazy profile' })
map('n', '<leader>lu', '<cmd>Lazy update<cr>', { desc = 'Lazy update' })

-- Lsp
map('n', '<Leader>li', '<cmd>LspInfo<cr>', { desc = 'Lsp Info' })
map('n', '<Leader>ll', '<cmd>LspLog<cr>', { desc = 'Lsp Log' })
map('n', '<Leader>lr', '<cmd>LspRestart<cr>', { desc = 'Lsp Restart' })
