---@module 'lazy.types'
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
				require('persistence').load({ last = true })
			end,
			desc = '[L]ast [S]ession',
		},
		{
			'<leader>R',
			function()
				require('persistence').save()
				vim.cmd.restart()
			end,
			desc = '[R]estart NeoVim with session',
		},
	},

	config = true,
}
