---@type LazySpec
return {
	'iamcco/markdown-preview.nvim',
	enabled = vim.fn.executable('yarn') == 1,

	ft = 'markdown',
	build = 'cd app && yarn install',
	keys = {
		{ '<leader>md', '<cmd>MarkdownPreview<cr>', desc = 'Markdown Preview' },
	},
	init = function()
		vim.g.mkdp_port = '5000'
		vim.g.mkdp_theme = 'dark'
	end,
}
