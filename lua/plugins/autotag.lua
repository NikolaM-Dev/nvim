return {
	'windwp/nvim-ts-autotag',
	dependencies = 'nvim-treesitter/nvim-treesitter',
	event = { 'BufAdd', 'BufNewFile', 'BufReadPre' },
}
