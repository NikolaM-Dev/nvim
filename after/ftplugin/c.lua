nkl.opt.indent(2, 'spaces')

vim.opt_local.colorcolumn = '80'
vim.opt_local.textwidth = 80

local bmap = nkl.key.bmap
bmap('i', ';;', '<Esc>mzA;<Esc>`za', { desc = '  Insert `;` at the eol and comeback' })
bmap('i', '\'', '""<Left>', { desc = '  Insert `"$0"` after type `\'$0\'`' })
bmap('i', '"', '\'\'<Left>', { desc = '  Insert `\'$0\'` after type `"$0"`' })
