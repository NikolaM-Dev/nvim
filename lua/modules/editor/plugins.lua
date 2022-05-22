local editor = {}
local conf = require('modules.editor.config')

editor['nvim-treesitter/nvim-treesitter'] = {
  event  = { 'BufRead', 'BufNewFile' },
  run    = ':TSUpdate',
  config = conf.nvim_treesitter,
}

return editor
