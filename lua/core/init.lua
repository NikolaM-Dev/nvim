pcall(require, 'impatient')

local load_core = function()
	require('core.options')
	require('core.plugins')

	require('modules')
	require('keymap')
end

load_core()
