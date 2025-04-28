---@module 'lazy'
---@type LazySpec
return {
	'folke/persistence.nvim',
	desc = 'Simple session management for Neovim',
	enabled = true,

	event = 'BufReadPre',

	keys = {
		{
			'<leader>ls',
			function()
				require('persistence').load()
			end,
			desc = '[L]ast [S]ession',
		},
	},

	config = true,
}
