---@module 'lazy.types'
---@type LazySpec
return {
	'zk-org/zk-nvim',
	desc = 'Neovim extension for zk',
	enabled = true,

	ft = 'markdown',

	keys = {
		{ '<C-n><C-i>', '<cmd>ZkInsertLink<cr>', desc = '[Z]k [L]inks', mode = 'i' },
		{ '<leader>ze', '<cmd>ZkNotes { sort = { \'modified\' } }<cr>', desc = '[Z]k [E]dit' },
		{ 'gb', '<cmd>ZkBacklinks<cr>', desc = '[Z]k [B]acklinks' },
		{ 'gl', '<cmd>ZkLinks<cr>', desc = '[Z]k [L]inks' },
	},

	---@type table
	opts = {
		picker = 'snacks_picker',
		picker_options = {
			---@module 'snacks'
			---@type snacks.picker.config
			snacks_picker = {
				win = {
					preview = {
						wo = {
							wrap = true,
						},
					},
				},
			},
		},
	},

	---@param opts? table
	config = function(_, opts)
		require('zk').setup(opts)
	end,
}
