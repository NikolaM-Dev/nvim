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

		---@class nkl.debug
		---@field adapters? table<string, dap.Adapter|dap.AdapterFactory>
		---@field configurations? table<string, dap.Configuration[]>
		opts = {
			adapters = {},
			configurations = {},
		},

		---@param opts nkl.debug
		config = function(_, opts)
			local dap = require('dap')
			dap.adapters = opts.adapters
			dap.configurations = opts.configurations

			for name, sign in pairs({
				Breakpoint = '',
				BreakpointCondition = '',
				BreakpointRejected = '',
				LogPoint = '',
				Stopped = { '', 'DiagnosticWarn', '' },
			}) do
				---@type table
				sign = type(sign) == 'table' and sign or { sign }
				vim.fn.sign_define('Dap' .. name, {
					text = sign[1],
					texthl = sign[2] or 'DiagnosticError',
					linehl = sign[3],
					numhl = sign[3],
				})
			end
		end,
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
		---@diagnostic disable-next-line: missing-fields
		opts = {
			layouts = {
				{
					elements = {
						{ id = 'scopes', size = 0.3 },
						{ id = 'watches', size = 0.5 },
						{ id = 'stacks', size = 0.2 },
					},
					size = 0.2,
					position = 'left',
				},
				{
					elements = {
						{ id = 'console', size = 0.5 },
						{ id = 'repl', size = 0.3 },
						{ id = 'breakpoints', size = 0.2 },
					},
					size = 0.2,
					position = 'right',
				},
			},

			---@diagnostic disable-next-line: missing-fields
			floating = {
				border = vim.o.winborder,
				max_height = 0.5,
				max_width = 0.9,
			},

			---@diagnostic disable-next-line: missing-fields
			controls = {
				element = 'breakpoints',
				icons = {
					disconnect = '',
					pause = '',
					play = '',
					run_last = '',
					step_back = '',
					step_into = '󰆹',
					step_out = '󰆸',
					step_over = '',
					terminate = '',
				},
			},

			---@diagnostic disable-next-line: missing-fields
			render = {
				max_value_lines = 3,
				sort_variables = function(a, b)
					return a.name < b.name
				end,
			},
		},

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
