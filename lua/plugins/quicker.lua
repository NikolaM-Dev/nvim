---@module 'lazy.types'
---@type LazySpec
return {
	'stevearc/quicker.nvim',
	desc = 'Improved UI and workflow for the Neovim quickfix',
	enabled = true,

	ft = 'qf',

	keys = {
		{
			'<leader>xq',
			function()
				require('quicker').toggle()
			end,
			desc = 'Toggle quickfix',
		},
		{
			'<leader>xl',
			function()
				require('quicker').toggle({ loclist = true })
			end,
			desc = 'Toggle loclist list',
		},
		{
			'<leader>xd',
			function()
				local quicker = require('quicker')

				if quicker.is_open() then
					quicker.close()
				else
					vim.diagnostic.setqflist()
				end
			end,
			desc = 'Toggle diagnostics',
		},
		{
			'>',
			function()
				require('quicker').expand({ before = 2, after = 2, add_to_existing = true })
			end,
			desc = 'Expand context',
		},
		{
			'<',
			function()
				require('quicker').collapse()
			end,
			desc = 'Collapse context',
		},
	},

	---@module 'quicker'
	---@type quicker.SetupOptions
	opts = {
		borders = {
			vert = '│',
		},
	},
}
