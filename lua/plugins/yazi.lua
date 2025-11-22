---@module 'lazy.types'
---@type LazySpec
return {
	'mikavilpas/yazi.nvim',
	desc = ' A Neovim Plugin for the yazi terminal file manager',
	enabled = true,

	keys = {
		{
			'<leader>e',
			mode = { 'n', 'v' },
			'<cmd>Yazi<cr>',
			desc = 'Open yazi at the current file',
		},
		{
			'<leader>E',
			'<cmd>Yazi cwd<cr>',
			desc = 'Open yazi at the current working directory',
		},
	},

	init = function()
		-- To use open_for_directories = true
		vim.g.loaded_netrwPlugin = 1
	end,

	---@module 'yazi'
	---@type YaziConfig
	opts = {
		floating_window_scaling_factor = 1,
		open_for_directories = true,
		yazi_floating_window_border = vim.o.winborder,
	},
}
