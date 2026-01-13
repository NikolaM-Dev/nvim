nkl.opt.indent(4, 'tabs')

local bmap = nkl.key.bmap
bmap('i', ';', ':=', { desc = '󰟓  Insert `:=` after type `;`' })
bmap('i', ',,', '<-', { desc = '󰟓  Insert `<-` after type `,,`' })
bmap('i', '..', '->', { desc = '󰟓  Insert `->` after type `;;`' })
bmap('i', '\'', '""<Left>', { desc = '󰟓  Insert `"$0"` after type `\'$0\'`' })
bmap('i', '"', '\'\'<Left>', { desc = '󰟓  Insert `\'$0\'` after type `"$0"`' })
