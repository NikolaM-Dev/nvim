return {
	{
		'nvim-treesitter/nvim-treesitter',
		ft = 'lua',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'lua', 'luadoc', 'query' })
		end,
	},
}
