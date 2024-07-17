---@type LazySpec
return {
	'supermaven-inc/supermaven-nvim',
	enabled = true,

	-- TODO: Remove this when https://github.com/supermaven-inc/supermaven-nvim/issues/74 is fixed
	commit = 'df3ecf7',
	event = 'InsertEnter',
	keys = {
		{ '<leader>ai', '<cmd>SupermavenToggle<cr>', desc = 'Toggle Supermaven [A][I]' },
	},
	config = function()
		require('supermaven-nvim').setup({})
	end,
}
