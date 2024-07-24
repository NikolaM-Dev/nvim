---@type LazySpec
return {
	'iamcco/markdown-preview.nvim',
	enabled = true,

	ft = 'markdown',
	build = function()
		vim.fn['mkdp#util#install']()
	end,
	keys = {
		{ '<leader>md', '<cmd>MarkdownPreview<cr>', desc = 'Markdown Preview' },
	},
	init = function()
		vim.g.mkdp_port = '5000'
		vim.g.mkdp_theme = 'dark'
	end,
}
