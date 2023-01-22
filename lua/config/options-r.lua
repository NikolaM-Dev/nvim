local options = {
	backup = false, -- creates a backup file
	breakindent = true, -- preserve indent on wrapped lines
	clipboard = 'unnamedplus', -- allows neovim to access the system clipboard
	cmdheight = 0, -- more space in the neovim command line for displaying messages
	completeopt = { 'menu', 'menuone', 'noselect' }, -- mostly just for cmp
	conceallevel = 0, -- Hide * markup for bold and italic
	cursorline = true, -- highlight the current line
	expandtab = true, -- convert tabs to spaces
	fileencoding = 'utf-8', -- the encoding written to a file
	fillchars = { foldopen = '', foldclose = '', fold = ' ', foldsep = ' ', diff = '╱', eob = ' ' },
	foldcolumn = '0',
	foldenable = true, -- enable folding
	foldlevel = 99, -- Using ufo provider need a large value, feel free to decrease the value
	foldlevelstart = 99,
	foldnestmax = 10, -- max fold nesting level
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	joinspaces = false, -- No double spaces with join after a dot
	laststatus = 0, -- not needed with lualine
	linebreak = true, -- break lines at delimiter chars
	mouse = 'a', -- default value of "a", "nv" disables in insert
	number = true, -- set numbered lines
	numberwidth = 2, -- set number column width to 2 {default 4}
	pumblend = 10, -- Popup blend
	pumheight = 10, -- pop up menu height
	relativenumber = true, -- set relative numbered lines
	ruler = false,
	scrolloff = 8, -- lines of ceontext
	shiftround = true, -- round indent
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	shortmess = 'filnxtToOFWIcC', -- remove short message fluff
	showmatch = true, -- show matching paren on creation
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 0, -- always show tabs
	sidescrolloff = 8,
	signcolumn = 'yes', -- always show the sign column, otherwise it would shift the text each time
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	softtabstop = 2, -- how many spaces is a tab press worth
	spelllang = 'en_us',
	splitbelow = true, -- force all horizontal splits to go below current window
	splitkeep = 'screen', -- stabilize screen position on split
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	tabstop = 2, -- insert 2 spaces for a tab
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	whichwrap = 'bs<>[]hl', -- which "horizontal" keys are allowed to travel to prev/next line
	wildmode = 'longest:full,full', -- Command-line completion mode
	wrap = true, -- display lines as one long line
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.iskeyword:append('-') -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ 'c', 'r', 'o' }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.

vim.g.markdown_fenced_languages = { 'html', 'python', 'bash=sh', 'R=r' }
-- fix markdown indentation settings
vim.g.markdown_recommended_style = 0

require('util.status')
