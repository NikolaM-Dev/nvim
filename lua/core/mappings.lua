local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- Normal
-- Better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

map('n', '<C-s>', ':w<CR>', opts)
map('n', '<C-q>', ':q<CR>', opts)

-- Insert
map('i', '<C-s>', '<ESC>:w<CR>', opts)
map('i', '<C-q>', '<ESC>:q<CR>', opts)
map('i', '<C-k>', '<ESC>O', opts)
map('i', '<C-j>', '<ESC>o', opts)
map('i', 'ii', '<ESC>', opts)

-- Visual --
-- Stay in indent mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- -- default map
-- local def_map = {
-- 	-- Vim map
-- 	['n|<C-x>k'] = map_cr('bdelete'):with_noremap():with_silent(),
-- 	['n|<C-s>'] = map_cu('write'):with_noremap(),
-- 	['n|Y'] = map_cmd('y$'),
-- 	['n|]w'] = map_cu('WhitespaceNext'):with_noremap(),
-- 	['n|[w'] = map_cu('WhitespacePrev'):with_noremap(),
-- 	['n|]b'] = map_cu('bp'):with_noremap(),
-- 	['n|[b'] = map_cu('bn'):with_noremap(),
-- 	['n|<Space>cw'] = map_cu([[silent! keeppatterns %substitute/\s\+$//e]]):with_noremap():with_silent(),
-- 	['n|<C-h>'] = map_cmd('<C-w>h'):with_noremap(),
-- 	['n|<C-l>'] = map_cmd('<C-w>l'):with_noremap(),
-- 	['n|<C-j>'] = map_cmd('<C-w>j'):with_noremap(),
-- 	['n|<C-k>'] = map_cmd('<C-w>k'):with_noremap(),
-- 	['n|<A-[>'] = map_cr('vertical resize -5'):with_silent(),
-- 	['n|<A-]>'] = map_cr('vertical resize +5'):with_silent(),
-- 	['n|<C-q>'] = map_cmd(':wq<CR>'),
-- 	['n|<Leader>ss'] = map_cu('SessionSave'):with_noremap(),
-- 	['n|<Leader>sl'] = map_cu('SessionLoad'):with_noremap(),
-- 	-- Insert
-- 	['i|<C-w>'] = map_cmd('<C-[>diwa'):with_noremap(),
-- 	['i|<C-h>'] = map_cmd('<BS>'):with_noremap(),
-- 	['i|<C-d>'] = map_cmd('<Del>'):with_noremap(),
-- 	['i|<C-u>'] = map_cmd('<C-G>u<C-U>'):with_noremap(),
-- 	['i|<C-b>'] = map_cmd('<Left>'):with_noremap(),
-- 	['i|<C-f>'] = map_cmd('<Right>'):with_noremap(),
-- 	['i|<C-a>'] = map_cmd('<ESC>^i'):with_noremap(),
-- 	['i|<C-j>'] = map_cmd('<Esc>o'):with_noremap(),
-- 	['i|<C-k>'] = map_cmd('<Esc>O'):with_noremap(),
-- 	['i|<C-s>'] = map_cmd('<Esc>:w<CR>'),
-- 	['i|<C-q>'] = map_cmd('<Esc>:wq<CR>'),
-- 	['i|<C-e>'] = map_cmd('<End>'):with_noremap(),
-- 	['i|<C-t>'] = map_cmd([[pumvisible() ? '\<C-e>' : '\<End>']]):with_noremap():with_expr(),
-- 	-- command line
-- 	['c|<C-b>'] = map_cmd('<Left>'):with_noremap(),
-- 	['c|<C-f>'] = map_cmd('<Right>'):with_noremap(),
-- 	['c|<C-a>'] = map_cmd('<Home>'):with_noremap(),
-- 	['c|<C-e>'] = map_cmd('<End>'):with_noremap(),
-- 	['c|<C-d>'] = map_cmd('<Del>'):with_noremap(),
-- 	['c|<C-h>'] = map_cmd('<BS>'):with_noremap(),
-- 	['c|<C-t>'] = map_cmd([[<C-R>=expand('%:p:h') . '/' <CR>]]):with_noremap(),
-- }
