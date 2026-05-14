nkl.opt.indent(4, 'tabs')

local bmap = nkl.key.bmap
bmap('n', '<C-q>', '<cmd>CompileCloseBuffer<cr>', { desc = '  Close Compile Buffer' })
bmap('n', '<leader><C-q>', '<cmd>QuickfixErrors<cr>', { desc = '  Quickfix Errors' })
