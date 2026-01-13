nkl.opt.indent(2, 'spaces')

vim.opt_local.colorcolumn = '80'
vim.opt_local.commentstring = '// %s'
vim.opt_local.textwidth = 80

vim.opt_local.conceallevel = 0

local bmap = nkl.key.bmap
bmap('i', '\'', '""<Left>', { desc = '󰟓  Insert `"$0"` after type `\'$0\'`' })
bmap('i', '"', '\'\'<Left>', { desc = '󰟓  Insert `\'$0\'` after type `"$0"`' })
