local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Telescope
keymap('n', '<leader>ff', ':lua require"telescope.builtin".git_files()<CR>', opts)
keymap('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>', opts)

-- Explorer
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Packer
keymap('n', '<leader>ps', ':PackerSync<CR>')
