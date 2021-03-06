local options = {
	backup = false, -- create backup files
	clipboard = 'unnamedplus', -- use system clipboard
	colorcolumn = '80', -- maximum column length for color highlighting
	cursorline = true, -- highlight current line
	fileencoding = 'utf-8', -- file encoding for the current buffer
	laststatus = 3, -- always and ONLY the last window a status line
	list = true, -- useful to see the difference between tabs and spaces and for trailing blanks
	listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←', -- strings to use in list mode
	mouse = 'a', -- mouse support
	number = true, -- show line numbers
	relativenumber = true, -- show relative numbers
	showmode = false, -- removes the text indicating the mode
	splitbelow = true, -- split window below
	splitright = true, -- split window right
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	wrap = false, -- wrap lines
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

for o, v in pairs(options) do
	vim.opt[o] = v
end
