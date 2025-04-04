vim.o.autoread = true -- automatically read the file when changed outside of neovim
vim.o.backup = false -- create backup files
vim.o.laststatus = 3 -- always and ONLY the last window a status line
vim.o.linebreak = true -- wrap long lines at characters, not in the middle of a word
vim.o.number = true -- show line numbers
vim.o.relativenumber = true -- show relative numbers
vim.o.showmode = false -- removes the text indicating the mode
vim.o.signcolumn = 'yes:2' -- always show the sign column, otherwise it would shift the text each time
vim.o.splitbelow = true -- split window below
vim.o.splitright = true -- split window right
vim.o.winborder = 'rounded' -- Defines the default border style of floating windows
vim.o.wrap = false -- wrap lines

vim.schedule(function()
	vim.o.clipboard = 'unnamedplus' -- use system clipboard
end)
