vim.opt.listchars = {
	-- eol = '¬',
	extends = '»',
	lead = ' ',
	nbsp = '␣',
	precedes = '«',
	space = ' ',
	tab = '  ', -- │
	trail = '·',
}

vim.opt.fillchars = {
	diff = '╱',
	eob = ' ',
	fold = ' ',
	foldclose = '',
	foldopen = '',
	foldsep = ' ',
}

vim.opt.sessionoptions = {
	'buffers',
	'curdir',
	'folds',
	'globals',
	'help',
	'skiprtp',
	'tabpages',
	'winsize',
}

vim.opt.autoread = true -- automatically read the file when changed outside of neovim
vim.opt.backup = false -- create backup files
vim.opt.colorcolumn = '80' -- maximum column length for color highlighting
vim.opt.completeopt = 'menu,menuone,noinsert' -- cmp complete options
vim.opt.cursorline = true -- highlight current line
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.fileencoding = 'utf8' -- file encoding for the current buffer
vim.opt.foldcolumn = '0' -- dont show fold column
vim.opt.foldenable = true -- enable folds
vim.opt.foldlevel = 99 -- using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99 -- does not start with all folds closed
vim.opt.foldmethod = 'expr' -- the kind of folding used for the current window
vim.opt.fsync = false -- This flushes the file to disk, ensuring that it is safely written
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.inccommand = 'split' -- Incrementally show effects of commands, opens split
vim.opt.incsearch = true -- while typing a search command, show where the pattern,
vim.opt.joinspaces = false -- No double spaces with join after a dot
vim.opt.laststatus = 3 -- always and ONLY the last window a status line
vim.opt.linebreak = true -- wrap long lines at characters, not in the middle of a word
vim.opt.list = true -- useful to see the difference between tabs and spaces and for trailing blanks
vim.opt.mouse = 'a' -- mouse support
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative numbers
vim.opt.scrolloff = 8 -- leave 8 lines above and below cursor
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.showbreak = '' -- strin to put at the start of lines that have been wrapped
vim.opt.showmode = false -- removes the text indicating the mode
vim.opt.showtabline = 0 -- remove tab page label
vim.opt.signcolumn = 'yes' -- always show the sign column, otherwise it would shift the text each time
vim.opt.smartcase = true -- difference between lower and upper case letters
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.softtabstop = 4 -- number of spaces that a tab
vim.opt.spelllang = 'en_us'
vim.opt.splitbelow = true -- split window below
vim.opt.splitkeep = 'screen' -- stabilize screen position on split
vim.opt.splitright = true -- split window right
vim.opt.swapfile = false -- creates a swapfile
vim.opt.tabstop = 4 -- insert <x> spaces for a tab
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undodir = os.getenv('HOME') .. '/.cache/nvim/undodir' -- undodir path
vim.opt.undofile = true -- make undo file
vim.opt.updatetime = 40 -- improve user experience updating more frequently
vim.opt.whichwrap = 'b,s,<,>,[,]'
vim.opt.wildmode = 'longest:full,full' -- Command-line completion mode
vim.opt.winbar = '%=%m %t' -- the window bar is a bar that's shown at the top of every window with it enabled
vim.opt.wrap = false -- wrap lines
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus' -- use system clipboard
end)
