return {
	'windwp/nvim-ts-autotag',
	dependencies = 'nvim-treesitter/nvim-treesitter',
	event = { 'BufAdd', 'BufNewFile', 'BufReadPre' },
	config = function()
		require('nvim-ts-autotag').setup({
			enable = true,
		})
	end,
}
