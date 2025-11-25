vim.opt_local.expandtab = false
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4

local bmap = nkl.key.bmap
bmap('i', ';', ':=', { desc = '󰟓  Insert `:=` after type `;`' })
bmap('i', ',', '<-', { desc = '󰟓  Insert `<-` after type `,`' })
bmap('i', ',,', '->', { desc = '󰟓  Insert `->` after type `,,`' })
bmap('i', '\'', '""<Left>', { desc = '󰟓  Insert `"$0"` after type `\'$0\'`' })
bmap('i', '"', '\'\'<Left>', { desc = '󰟓  Insert `\'$0\'` after type `"$0"`' })
