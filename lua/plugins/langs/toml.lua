return {
	{
		'nvim-treesitter/nvim-treesitter',
		ft = { 'toml' },
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'toml' })
		end,
	},
}
