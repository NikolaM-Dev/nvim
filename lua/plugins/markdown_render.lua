---@type LazySpec
return {
	'MeanderingProgrammer/markdown.nvim',
	enabled = true,

	cmd = 'RenderMarkdown',
	main = 'render-markdown',
	name = 'render-markdown',
	ft = { 'markdown' },

	---@type render.md.UserConfig
	opts = {},

	---@param opts render.md.UserConfig
	config = function(_, opts)
		local PALETTE = require('catppuccin.palettes').get_palette('mocha')

		vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { bg = PALETTE.crust })
		vim.api.nvim_set_hl(0, 'RenderMarkdownCodeInline', { fg = PALETTE.sky })
		vim.api.nvim_set_hl(0, 'RenderMarkdownDash', { fg = PALETTE.blue })

		require('render-markdown').setup(opts)
	end,
}
