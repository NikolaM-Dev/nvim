local function map(mode, lhs, rhs, opts)
	local keys = require('lazy.core.handler').handlers.keys

	---@cast keys LazyKeysHandler
	-- do not create the keymap if a lazy keys handler exists
	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
		opts = opts or {}
		opts.silent = opts.silent ~= false
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

-- Better up/down
map('n', 'k', 'v:count == 0 ? \'gk\' : \'k\'', { expr = true, silent = true })
map('n', 'j', 'v:count == 0 ? \'gj\' : \'j\'', { expr = true, silent = true })

-- Move Lines
map('i', '<A-J>', '<Esc>:m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<A-K>', '<Esc>:m .-2<cr>==gi', { desc = 'Move up' })
map('n', '<A-J>', ':m .+1<cr>==', { desc = 'Move down' })
map('n', '<A-K>', ':m .-2<cr>==', { desc = 'Move up' })
map('v', '<A-J>', ':m \'>+1<cr>gv=gv', { desc = 'Move down' })
map('v', '<A-K>', ':m \'<-2<cr>gv=gv', { desc = 'Move up' })

-- Clear search with <esc>
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- Better indenting
map('v', '<', '<gv', { desc = 'Indent Left' })
map('v', '>', '>gv', { desc = 'Indent right' })

-- Sort
map('v', '<leader>s', ':!sort<cr>', { desc = 'Sort' })

-- Save
map({ 'i', 'n', 's', 'v' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Save all
map('n', '<leader>w', '<cmd>wall<cr>', { desc = 'Write all' })

-- Quit
map('n', '<C-q>', function()
	if #vim.fn.gettabinfo() > 1 then
		return vim.cmd.tabclose()
	end

	vim.cmd.quit()
end, { desc = 'Quit' })

-- Quit & save
map('i', '<C-q>', '<esc><cmd>wq<cr>', { desc = 'Quit' })

-- Quit all
map('n', '<leader>q', '<cmd>qall<cr>', { desc = 'Quit all' })

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
