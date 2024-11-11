---@type LazySpec
return {
	'supermaven-inc/supermaven-nvim',
	enabled = true,

	event = 'InsertEnter',
	commit = '40bde487fe31723cdd180843b182f70c6a991226',

	keys = {
		{ '<leader>ai', '<cmd>SupermavenToggle<cr>', desc = 'Toggle Supermaven [A][I]' },
	},

	config = true,
}
