local ui = {}
local conf = require('modules.ui.config')

ui['kyazdani42/nvim-web-devicons'] = { opt = false }

ui['glepnir/zephyr-nvim'] = {
  config = [[vim.cmd('colorscheme zephyr')]]
}

ui['kyazdani42/nvim-tree.lua'] = {
  opt = true,
  cmd = { 'NvimTreeToggle' },
  config = conf.nvim_tree,
}

return ui
