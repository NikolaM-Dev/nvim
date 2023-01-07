local options = {
	listchars = {
		-- eol = '¬',
		extends = '»',
		lead = ' ',
		nbsp = '␣',
		precedes = '«',
		space = ' ',
		tab = '│ ',
		trail = '·',
	},
	backup = false, -- create backup files
	clipboard = 'unnamedplus', -- use system clipboard
	colorcolumn = '81', -- maximum column length for color highlighting
	completeopt = { 'menu', 'menuone', 'noselect' }, -- cmp complete options
	cursorline = true, -- highlight current line
	expandtab = true, -- convert tabs to spaces
	fileencoding = 'utf-8', -- file encoding for the current buffer
	foldexpr = 'nvim_treesitter#foldexpr()', -- code folding with tressitter
	foldlevelstart = 99, -- does not start with all folds closed
	foldmethod = 'expr', -- the kind of folding used for the current window
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	inccommand = 'split', -- Incrementally show effects of commands, opens split
	incsearch = true, -- while typing a search command, show where the pattern,
	laststatus = 3, -- always and ONLY the last window a status line
	list = true, -- useful to see the difference between tabs and spaces and for trailing blanks
	mouse = 'a', -- mouse support
	number = true, -- show line numbers
	relativenumber = true, -- show relative numbers
	scrolloff = 8, -- leave 8 lines above and below cursor
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	showbreak = '↳  ', -- string to put at the start of lines that have been wrapped
	showmode = false, -- removes the text indicating the mode
	signcolumn = 'yes', -- always show the sign column, otherwise it would shift the text each time
	smartcase = true, -- difference between lower and upper case letters
	smartindent = true, -- make indenting smarter again
	softtabstop = 4, -- number of spaces that a tab
	splitbelow = true, -- split window below
	splitright = true, -- split window right
	swapfile = false, -- creates a swapfile
	tabstop = 4, -- insert <x> spaces for a tab
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
	undodir = os.getenv('HOME') .. '/.cache/nvim/undodir', -- undodir path
	undofile = true, -- make undo file
	updatetime = 50, -- improve user experience updating more frequently
	winbar = '%=%m %f', -- The window bar is a bar that's shown at the top of every window with it enabled
	wrap = false, -- wrap lines
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

for o, v in pairs(options) do
	vim.opt[o] = v
end
