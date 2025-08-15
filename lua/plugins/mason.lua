---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'williamboman/mason.nvim',
	desc = 'Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters',
	enabled = true,

	event = 'VeryLazy',

	keys = {
		{ '<leader>cm', '<cmd>Mason<cr>', desc = '[M]ason' },
	},

	opts = {
		ensure_installed = {},
	},

	config = function(_, opts)
		require('mason').setup({
			ensure_installed = opts.ensure_installed,
			ui = {
				icons = {
					package_installed = '󰄳 ',
					package_pending = ' ',
					package_uninstalled = '󰚌 ',
				},
			},
		})

		local mason_registry = require('mason-registry')
		local function ensure_installed()
			for _, s in ipairs(opts.ensure_installed) do
				local p = mason_registry.get_package(s)

				if not p:is_installed() then
					p:install()
				end
			end
		end

		if mason_registry.refresh then
			mason_registry.refresh(ensure_installed)
		else
			ensure_installed()
		end
	end,
}
