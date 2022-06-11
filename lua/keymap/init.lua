local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Telescope
keymap('n', '<leader>ff', ':lua require"telescope.builtin".find_files()<CR>', opts)
keymap('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>', opts)

-- local bind = require('keymap.bind')
-- local map_cr = bind.map_cr
-- local map_cu = bind.map_cu
-- local map_cmd = bind.map_cmd
-- local map_args = bind.map_args
-- require('keymap.config')

-- local plug_map = {
-- 	-- Packer
-- 	['n|<leader>ps'] = map_cr('PackerSync'):with_silent():with_noremap():with_nowait(),
-- 	['n|<leader>pu'] = map_cr('PackerUpdate'):with_silent():with_noremap():with_nowait(),
-- 	['n|<leader>pi'] = map_cr('PackerInstall'):with_silent():with_noremap():with_nowait(),
-- 	['n|<leader>pc'] = map_cr('PackerClean'):with_silent():with_noremap():with_nowait(),

-- 	-- Plugin nvim-tree
-- 	['n|<Leader>e'] = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
-- 	['n|<Leader>F'] = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),
-- }

-- bind.nvim_load_mapping(plug_map)
