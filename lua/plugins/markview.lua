---@module 'lazy'
---@type LazySpec
return {
	'OXY2DEV/markview.nvim',
	desc = 'A hackable markdown, Typst, latex, html(inline) & YAML previewer for Neovim',
	enabled = false,

	lazy = false, -- Don't lazy load this plugin as it is already lazy-loaded

	---@type table
	opts = {
		markdown = {
			list_items = {
				marker_minus = {
					text = '•',
				},
			},
		},
	},
}
