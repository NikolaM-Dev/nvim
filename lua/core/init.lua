local leader_map = function()
	vim.g.mapleader = ' '
	vim.api.nvim_set_keymap('n', ' ', '', { noremap = true })
	vim.api.nvim_set_keymap('x', ' ', '', { noremap = true })
end

local load_core = function()
	leader_map()
end

load_core()
