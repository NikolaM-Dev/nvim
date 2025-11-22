---@module 'lazy.types'
---@type LazySpec
return {
	'nvim-treesitter/nvim-treesitter',
	desc = 'Nvim Treesitter configurations and abstraction layer',
	enabled = true,

	event = { 'BufNewFile', 'BufReadPost', 'BufWritePre', 'VeryLazy' },
	build = ':TSUpdate',

	opts = {
		languages = {},
	},

	config = function(_, opts)
		---@diagnostic disable-next-line: missing-fields
		require('nvim-treesitter.configs').setup({
			auto_install = false, -- Automatically install missing parsers when entering buffer
			ensure_installed = opts.languages,
			highlight = { enable = true },
		})
	end,
}
