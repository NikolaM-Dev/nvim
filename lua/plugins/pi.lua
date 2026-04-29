---@module 'lazy.types'
---@type LazySpec
return {
	'pablopunk/pi.nvim',
	desc = 'The most minimal AI coding agent, now in neovim',
	enabled = true,

	keys = {
		{ '<leader>ai', ':PiAsk<CR>', { desc = '  Ask PI' } },
		{ '<leader>ai', ':PiAskSelection<CR>', { desc = '  Ask PI' }, mode = 'v' },
	},

	setup = function()
		require('pi').setup({
			provider = 'opencode',
			model = 'minimax-m2.5-free',
		})
	end,
}
