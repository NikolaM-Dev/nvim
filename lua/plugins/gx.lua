---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'chrishrb/gx.nvim',
	desc = 'Implementation of gx without the need of netrw',
	enabled = true,

	keys = {
		{ 'gx', '<cmd>Browse<cr>', mode = { 'n', 'x' }, desc = 'Browse in browser' },
	},

	init = function()
		vim.g.netrw_nogx = 1 -- disable netrw gx
	end,

	config = true,
}
