---@module 'lazy.types'
---@type LazyPluginSpec[]
return {
	{
		'mfussenegger/nvim-dap',
		desc = 'Debug Adapter Protocol client implementation for Neovim',
		enabled = true,

		dependencies = {
			'rcarriga/nvim-dap-ui',
			'stevearc/overseer.nvim',
			'theHamsta/nvim-dap-virtual-text',
		},

		opts = {},

		config = function(_, _opts) end,
	},

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

		---@type dapui.config
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

	{
		'theHamsta/nvim-dap-virtual-text',
		desc = 'This plugin adds virtual text support to nvim-dap.',
		enabled = true,

		---@module 'nvim-dap-virtual-text'
		---@type nvim_dap_virtual_text_options
		opts = {
			all_frames = true,
			all_references = true,
			clear_on_continue = true,
			virt_text_pos = 'eol',
		},
	},

	{
		'stevearc/overseer.nvim',
		desc = 'A task runner and job management plugin for Neovim',
		enabled = true,

		---@module 'overseer'
		---@type overseer.SetupOpts
		opts = {},
	},
}
