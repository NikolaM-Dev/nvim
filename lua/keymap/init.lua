local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Telescope
keymap('n', '<leader>ff', ':lua require"telescope.builtin".git_files()<CR>', opts)
keymap('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>', opts)
keymap('n', '<leader>man', ':lua require"telescope.builtin".man_pages()<CR>', opts)

keymap('n', '<leader>gbc', ':lua require"telescope.builtin".git_bcommits()<CR>', opts)
keymap('n', '<leader>gb', ':lua require"telescope.builtin".git_branches()<CR>', opts)
keymap('n', '<leader>gc', ':lua require"telescope.builtin".git_commits()<CR>', opts)
keymap('n', '<leader>gs', ':lua require"telescope.builtin".git_status()<CR>', opts)
keymap('n', '<leader>gst', ':lua require"telescope.builtin".git_stash()<CR>', opts)

-- Fugitive
keymap('n', '<leader>ga', ':G add --all<CR>', opts)
keymap('n', '<leader>gap', ':G add % -p<CR>', opts)
keymap('n', '<leader>g', ':G<CR>', opts)
keymap('n', '<leader>gca', ':G commit --amend<CR>', opts)
keymap('n', '<leader>gi', ':G init<CR>', opts)
keymap('n', '<leader>gp', ':G push<CR>', opts)
keymap('n', '<leader>gpl', ':G pull<CR>', opts)
keymap('n', '<leader>gpo', ':G push origin -u HEAD<CR>', opts)
keymap('n', '<leader>gu', ':G reset --soft HEAD~1<CR>', opts) -- undo

-- Explorer
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Packer
keymap('n', '<leader>ps', ':PackerSync<CR>', opts)
