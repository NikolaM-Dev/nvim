---@module 'lazy.types'
---@type LazyPluginSpec"
return {
	'NickvanDyke/opencode.nvim',
	desc = 'Seamlessly integrate the opencode AI assistant with Neovim — convenient and editor-aware research, reviews, and requests.',
	enabled = true,

	keys = {
		-- stylua: ignore start
		{ '<S-C-d>',    function() require('opencode').command('messages_half_page_down') end, desc = 'Messages half page down' },
		{ '<S-C-u>',    function() require('opencode').command('messages_half_page_up') end, desc = 'Messages half page up' },
		{ '<leader>oA', function() require('opencode').ask() end, desc = 'Ask opencode' },
		{ '<leader>oa', function() require('opencode').ask('@cursor: ') end, desc = 'Ask opencode about this' },
		{ '<leader>oa', function() require('opencode').ask('@selection: ') end, desc = 'Ask opencode about selection' },
		{ '<leader>oe', function() require('opencode').prompt('Explain @cursor and its context') end,  desc = 'Explain this code' },
		{ '<leader>on', function() require('opencode').command('session_new') end, desc = 'New opencode session' },
		{ '<leader>os', function() require('opencode').select() end, desc = 'Select opencode prompt', mode = {'n', 'v'} },
		{ '<leader>ot', function() require('opencode').toggle() end, desc = 'Toggle opencode' },
		{ '<leader>oy', function() require('opencode').command('messages_copy') end, desc = 'Copy last opencode response' },
		-- stylua: ignore end
	},

	init = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {}
	end,

	config = true,
}
