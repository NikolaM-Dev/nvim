return {
	'iamcco/markdown-preview.nvim',
	build = 'cd app && npm install',
	ft = 'markdown',
	keys = { { '<leader>md', '<cmd>MarkdownPreview<cr>', desc = 'Markdown Preview' } },
	init = function()
		vim.g.mkdp_port = '5000'
		vim.g.mkdp_theme = 'dark'
	end,
}
