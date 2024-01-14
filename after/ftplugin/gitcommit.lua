vim.opt_local.spell = true

vim.keymap.set('n', '<leader>e', function()
	require('utils').go_to_window(1)
end)
