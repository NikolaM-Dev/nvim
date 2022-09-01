local status_ok, impatient = pcall(require, 'impatient')
if not status_ok then
	return
end

impatient.enable_profile()

local leader_map = function()
	vim.g.mapleader = ' '
	vim.api.nvim_set_keymap('n', ' ', '', { noremap = true })
	vim.api.nvim_set_keymap('x', ' ', '', { noremap = true })
end

local load_core = function()
	leader_map()

	require('core.options')
	require('core.mappings')
	require('core.plugins')

	require('modules')
	require('keymap')
end

load_core()
