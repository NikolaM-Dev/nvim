return {
	{
		'nvim-treesitter/nvim-treesitter',
		ft = 'yaml',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'yaml' })
		end,
	},
}
