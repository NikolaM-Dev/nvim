return {
	{
		'nvim-treesitter/nvim-treesitter',
		ft = 'python',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'python' })
		end,
	},
}
