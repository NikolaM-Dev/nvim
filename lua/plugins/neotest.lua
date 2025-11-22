---@module 'lazy.types'
---@type LazySpec
return {
	'nvim-neotest/neotest',
	desc = 'An extensible framework for interacting with tests within NeoVim',
	enabled = true,

	dependencies = 'nvim-neotest/nvim-nio',

	keys = function()
		local neotest = require('neotest')

		return {
			-- stylua: ignore start
			{ '<leader>t', '', desc = '+test' },
			{ '<leader>tt', function() neotest.run.run(vim.fn.expand('%')) end, desc = 'Run File (Neotest)' },
			{ '<leader>tT', function() neotest.run.run(vim.uv.cwd()) end, desc = 'Run All Test Files (Neotest)' },
			{ '<leader>tr', function() neotest.run.run() end, desc = 'Run Nearest (Neotest)' },
			{ '<leader>tl', function() neotest.run.run_last() end, desc = 'Run Last (Neotest)' },
			{ '<leader>ts', function() neotest.summary.toggle() end, desc = 'Toggle Summary (Neotest)' },
			{ '<leader>to', function() neotest.output.open({ enter = true, auto_close = true }) end, desc = 'Show Output (Neotest)' },
			{ '<leader>tO', function() neotest.output_panel.toggle() end, desc = 'Toggle Output Panel (Neotest)' },
			{ '<leader>tS', function() neotest.run.stop() end, desc = 'Stop (Neotest)' },
			{ '<leader>tw', function() neotest.watch.toggle(vim.fn.expand('%')) end, desc = 'Toggle Watch (Neotest)' },
			-- stylua: ignore end
		}
	end,

	---@type table
	opts = {
		adapters = {},
	},

	---@param opts table
	config = function(_, opts)
		require('neotest').setup(opts)
	end,
}
