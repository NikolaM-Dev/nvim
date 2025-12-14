vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4

local bmap = nkl.key.bmap
bmap('i', '\'', '""<Left>', { desc = '󰌠 Insert `"$0"` after type `\'$0\'`' })
bmap('i', '"', '\'\'<Left>', { desc = '󰌠 Insert `\'$0\'` after type `"$0"`' })
