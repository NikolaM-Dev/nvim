---@module 'lazy.types'
---@type LazyPluginSpec[]
return {
	{
		'rcarriga/nvim-dap-ui',
		desc = 'A UI for nvim-dap',
		enabled = true,

		dependencies = { 'nvim-neotest/nvim-nio' },

		keys = {
			-- stylua: ignore start
			{ '<leader>du', function() require('dapui').toggle({ reset = true }) end, desc = 'Dap UI' },
			{ '<leader>de', function() require('dapui').eval() end, desc = 'Eval', mode = { 'n', 'x' }},
			-- stylua: ignore end
		},

		---@type dapui.Config
		opts = {},

		---@param opts dapui.Config
		config = function(_, opts)
			local dapui = require('dapui')
			dapui.setup(opts)

			local dap = require('dap')
			dap.listeners.before.attach.dapui_config = dapui.open
			dap.listeners.before.launch.dapui_config = dapui.open
			dap.listeners.before.event_terminated.dapui_config = dapui.close
			dap.listeners.before.event_exited.dapui_config = dapui.close
		end,
	},
}
