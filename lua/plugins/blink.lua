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
		appearance = {
			nerd_font_variant = 'mono',
		},

		completion = {
			documentation = {
				auto_show = true,
			},
			ghost_text = {
				enabled = true,
			},
		},

		fuzzy = {
			implementation = 'prefer_rust_with_warning',
		},

		keymap = {
			preset = 'enter',

			['<C-j>'] = { 'select_next', 'fallback_to_mappings' },
			['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
			['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
			['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
		},

		signature = {
			enabled = true,
		},

		sources = {
			default = { 'snippets', 'lsp', 'path', 'buffer' },
		},
	},

	opts_extend = { 'sources.default' },
}
