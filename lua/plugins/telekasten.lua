return {
	'renerocksai/telekasten.nvim',
	enabled = false,

	keys = {
		{ '<leader>fo', '<cmd>Telekasten panel<cr>', desc = 'uwu' },
	},
	config = function()
		require('telekasten').setup({
			home = vim.fn.expand('~/zettelkasten'), -- Put the name of your notes directory here
		})
	end,
}
