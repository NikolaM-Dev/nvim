local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_args = bind.map_args
require('keymap.config')

local plug_map = {
  -- Packer
  ['n|<leader>ps'] = map_cr('PackerSync'):with_silent():with_noremap():with_nowait(),
  ['n|<leader>pu'] = map_cr('PackerUpdate'):with_silent():with_noremap():with_nowait(),
  ['n|<leader>pi'] = map_cr('PackerInstall'):with_silent():with_noremap():with_nowait(),
  ['n|<leader>pc'] = map_cr('PackerClean'):with_silent():with_noremap():with_nowait(),
};

bind.nvim_load_mapping(plug_map)
