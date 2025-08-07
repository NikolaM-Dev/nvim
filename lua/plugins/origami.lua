---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'chrisgrieser/nvim-origami',
	desc = 'Fold with relentless elegance. A collection of Quality-of-life features related to folding. ',
	enabled = true,

	event = 'VeryLazy',

	opts = {
		autoFold = {
			enabled = true,
			kinds = { 'comment', 'imports' }, ---@type lsp.FoldingRangeKind[]
		},
		foldtextWithLineCount = {
			enabled = true,
			template = '  󰘖 %s',
		},
	},
}
