local keymap = require('core.keymap')

local cmap, imap, nmap, vmap, xmap = keymap.cmap, keymap.imap, keymap.nmap, keymap.vmap, keymap.xmap
local cmd = keymap.cmd
local noremap, silent = keymap.noremap, keymap.silent
local opts = keymap.new_opts

-- use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

cmap({
	{ '<C-b>', '<Left>', opts(noremap) },
	{ '<C-f>', '<Right>', opts(noremap) },
	{ '<C-a>', '<Home>', opts(noremap) },
	{ '<C-e>', '<End>', opts(noremap) },
	{ '<C-d>', '<Del>', opts(noremap) },
	{ '<C-h>', '<BS>', opts(noremap) },
})

imap({
	-- save
	{ '<C-s>', '<ESC>:w<CR>', opts(noremap) },

	-- quit & save
	{ '<C-q>', '<ESC>:wq<CR>', opts(noremap) },

	-- insert line below
	{ '<C-j>', '<ESC>o', opts(noremap) },

	-- insert line above
	{ '<C-k>', '<ESC>O', opts(noremap) },

	-- back to normal mode
	{ 'ii', '<ESC>', opts(noremap) },
})

nmap({
	-- save
	{ '<C-s>', cmd('write'), opts(noremap) },

	-- quit
	{ '<C-q>', cmd('q'), opts(noremap) },

	-- quit all
	{ '<leader>q', cmd('qall'), opts(noremap) },

	-- quit without save
	{ '<leader>z', cmd('q!'), opts(noremap) },

	-- centralized search
	{ 'n', 'nzzzv', opts(noremap) },
	{ 'N', 'Nzzzv', opts(noremap) },

	-- centralized scroll
	{ '<C-u>', '<C-u>zz', opts(noremap) },
	{ '<C-d>', '<C-d>zz', opts(noremap) },

	-- window jump
	{ '<C-h>', '<C-w>h', opts(noremap) },
	{ '<C-j>', '<C-w>j', opts(noremap) },
	{ '<C-k>', '<C-w>k', opts(noremap) },
	{ '<C-l>', '<C-w>l', opts(noremap) },

	-- resize window
	{ '<A-h>', ':vertical resize -2<CR>', opts(noremap, silent) },
	{ '<A-j>', ':resize +2<CR>', opts(noremap, silent) },
	{ '<A-k>', ':resize -2<CR>', opts(noremap, silent) },
	{ '<A-l>', ':vertical resize +2<CR>', opts(noremap, silent) },

	-- fast reload
	{ '<A-r>', cmd('so'), opts(noremap) },

	-- remove highligths
	{ '<ESC>', ':noh<CR><CR>', opts(noremap, silent) },

	-- rename
	{ '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', opts(noremap) },

	-- tt
	{ '<leader>fm', ':silent !tmux display-popup -E "tt"<CR><CR>', opts(noremap, silent) },
})

vmap({
	-- sort
	{ '<leader>s', ':!sort<CR>', opts(noremap) },

	-- format json in http filetypes
	{ '<leader>jq', ':!jq<CR>', opts(noremap, silent) },

	-- rename
	{ '<leader><leader>s', ':s///gI<Left><Left><Left><Left>', opts(noremap) },

	-- stay in indent mode
	{ '<', '<gv', opts(noremap) },
	{ '>', '>gv', opts(noremap) },
})
