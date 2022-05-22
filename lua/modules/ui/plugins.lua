local ui = {}
local conf = require('modules.ui.config')

ui['kyazdani42/nvim-web-devicons'] = {}

ui['CanKolay3499/base46'] = {
  config = conf.base46,
}

ui['kyazdani42/nvim-tree.lua'] = {
  cmd    = { 'NvimTreeToggle' },
  config = conf.nvim_tree,
}

return ui
