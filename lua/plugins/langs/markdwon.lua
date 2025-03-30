return {
	{
		'nvim-treesitter/nvim-treesitter',
		ft = 'markdown',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'markdown', 'markdown_inline' })
		end,
	},
}
