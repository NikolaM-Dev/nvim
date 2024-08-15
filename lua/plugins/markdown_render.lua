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
		require('render-markdown').setup(opts)
	end,
}
