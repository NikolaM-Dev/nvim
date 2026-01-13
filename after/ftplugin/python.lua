nkl.opt.indent(4, 'spaces')

local bmap = nkl.key.bmap
bmap('i', '\'', '""<Left>', { desc = '󰌠 Insert `"$0"` after type `\'$0\'`' })
bmap('i', '"', '\'\'<Left>', { desc = '󰌠 Insert `\'$0\'` after type `"$0"`' })
