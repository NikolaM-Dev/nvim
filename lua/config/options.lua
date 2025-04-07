vim.o.autoread = true -- Automatically read the file when changed outside of neovim
vim.o.backup = false -- Create backup files
vim.o.laststatus = 3 -- always and ONLY the last window a status line
vim.o.laststatus = 3 -- Always and ONLY the last window a status line
vim.o.linebreak = true -- Wrap long lines at characters, not in the middle of a word
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Show relative numbers
vim.o.showmode = false -- Removes the text indicating the mode
vim.o.signcolumn = 'yes:2' -- Always show the sign column, otherwise it would shift the text each time
vim.o.splitbelow = true -- Split window below
vim.o.splitright = true -- Split window right
vim.o.winborder = 'rounded' -- Defines the default border style of floating windows
vim.o.wrap = false -- Wrap lines

vim.schedule(function()
	vim.o.clipboard = 'unnamedplus' -- use system clipboard
end)
