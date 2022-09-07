pcall(require, 'impatient')

local load_core = function()
	require('core.options')
	require('core.plugins')

	require('keymap')

	require('internal.event')
end

load_core()
