return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, {
				'diff',
				'git_config',
				'git_rebase',
				'gitattributes',
				'gitcommit',
				'gitignore',
			})
		end,
	},
}
