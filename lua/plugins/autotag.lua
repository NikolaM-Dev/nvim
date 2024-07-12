---@type LazySpec
return {
	'windwp/nvim-ts-autotag',
	enabled = true,

	dependencies = 'nvim-treesitter/nvim-treesitter',
	event = { 'BufAdd', 'BufNewFile', 'BufReadPre' },
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require('nvim-ts-autotag').setup({})
	end,
}
