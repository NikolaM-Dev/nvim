pcall(require, 'impatient')

local load_core = function()
	require('core.disable')

	require('core.options')
	require('core.plugins')

	require('keymap')

	require('internal')
end

load_core()
