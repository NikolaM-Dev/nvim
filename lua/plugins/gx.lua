---@module 'lazy.types'
---@type LazySpec
return {
	'chrishrb/gx.nvim',
	desc = 'Implementation of gx without the need of netrw',
	enabled = true,

	keys = {
		{ 'gx', '<cmd>Browse<cr>', desc = 'Browse in browser', mode = { 'n', 'x' } },
	},

	init = function()
		vim.g.netrw_nogx = 1 -- disable netrw gx
	end,

	config = true,
}
