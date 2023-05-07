return {
	'ziontee113/icon-picker.nvim',
	keys = { { '<C-i>', '<cmd>IconPickerYank<cr>', desc = '[I]con Picker' } },
	config = function()
		require('icon-picker').setup({
			disable_legacy_commands = true,
		})
	end,
}
