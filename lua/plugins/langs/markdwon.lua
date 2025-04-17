return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'markdown', 'markdown_inline' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'marksman', 'prettier' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.marksman = {}
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = function(_, opts)
			opts.formatters_by_ft.markdown = { 'prettier' }
		end,
	},
	{
		'bullets-vim/bullets.vim',
		desc = 'Automated bullet lists',
		enabled = true,

		ft = { 'gitcommit', 'markdown', 'text' },
		init = function()
			vim.g.bullets_checkbox_markers = ' .oOx' -- Change `X` to `x` to keep markdown format standard
			vim.g.bullets_outline_levels = { 'ROM', 'ABC', 'num', 'abc', 'rom', 'std-' } -- Remove * + as outline levels
		end,
	},
}
