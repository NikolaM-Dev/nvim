---@module 'lazy.types'
---@type LazySpec
return {
	{
		'nvim-treesitter/nvim-treesitter',
		ft = { 'lua', 'vim' },
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'vim', 'vimdoc' })
		end,
	},
}
