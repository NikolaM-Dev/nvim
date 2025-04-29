---@module 'lazy'
---@type LazySpec
return {
	'saghen/blink.cmp',
	desc = 'Performant, batteries-included completion plugin for Neovim',
	docs = 'https://cmp.saghen.dev',
	enabled = true,

	version = '1.*',
	build = 'cargo build --release',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = 'enter' },
		appearance = {
			nerd_font_variant = 'mono',
		},


		sources = {
			default = { 'snippets', 'lsp', 'path', 'buffer' },
		},
	},

	opts_extend = { 'sources.default' },
}
