---@type LazySpec
return {
	'supermaven-inc/supermaven-nvim',
	enabled = true,

	event = 'InsertEnter',
	keys = {
		{ '<leader>ai', '<cmd>SupermavenToggle<cr>', desc = 'Toggle Supermaven [A][I]' },
	},
	config = function()
		require('supermaven-nvim').setup({})
	end,
}
