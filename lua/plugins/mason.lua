---@module 'lazy.types'
---@type LazySpec
return {
	'williamboman/mason.nvim',
	desc = 'Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters',
	enabled = true,

	event = 'VeryLazy',

	keys = {
		{ '<leader>M', '<cmd>Mason<cr>', desc = '[M]ason' },
	},

	opts = {
		ensure_installed = {},
	},

	config = function(_, opts)
		require('mason').setup({
			ui = {
				icons = {
					package_installed = '󰄳 ',
					package_pending = ' ',
					package_uninstalled = '󰚌 ',
				},
			},
		})

		-- Add binaries installed by mason.nvim to path
		vim.env.PATH = vim.fn.stdpath('data') .. '/mason/bin:' .. vim.env.PATH

		-- Auto install packages
		local mr = require('mason-registry')
		mr:on('package:install:success', function()
			vim.defer_fn(function()
				-- trigger FileType event to possibly load this newly installed LSP server
				require('lazy.core.handler.event').trigger({
					event = 'FileType',
					buf = vim.api.nvim_get_current_buf(),
				})
			end, 100)
		end)

		mr.refresh(function()
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end)
	end,
}
