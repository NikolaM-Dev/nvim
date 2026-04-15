---@module 'lazy.types'
---@type LazySpec
return {
	'chrishrb/gx.nvim',
	desc = 'Implementation of gx without the need of netrw',
	enabled = true,

	keys = {
		{ mode = { 'n', 'x' }, '<leader>gx', '<cmd>Browse<cr>', desc = ' Browse in Browser' },
	},

	init = function()
		vim.g.netrw_nogx = 1 -- disable netrw gx
	end,

	config = true,
}
