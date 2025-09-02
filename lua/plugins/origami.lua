---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'chrisgrieser/nvim-origami',
	desc = 'Fold with relentless elegance. A collection of Quality-of-life features related to folding.',
	enabled = true,

	event = 'VeryLazy',

	init = function()
		vim.o.foldlevel = 99 -- disable vim's auto-fold
		vim.o.foldlevelstart = 99
	end,

	opts = {
		autoFold = {
			kinds = { 'comment', 'imports' }, ---@type lsp.FoldingRangeKind[]
		},
		foldtext = {
			lineCount = { template = '󰘖 %d' },
			padding = 2,
		},
	},
}
