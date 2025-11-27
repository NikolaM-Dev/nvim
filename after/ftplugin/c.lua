vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 2

vim.opt_local.colorcolumn = '80'
vim.opt_local.textwidth = 80

local bmap = nkl.key.bmap
bmap('i', ';;', '<Esc>mzA;<Esc>`za', { desc = '  Insert `;` at the eol and comeback' })
bmap('i', '\'', '""<Left>', { desc = '  Insert `"$0"` after type `\'$0\'`' })
