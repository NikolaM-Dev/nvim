---@module 'lazy'
---@type LazySpec
return {
	'folke/flash.nvim',
	desc = 'Navigate your code with search labels, enhanced character motions and Treesitter integration',
	enabled = true,

	event = 'VeryLazy',

	---@module 'flash'
	---@type Flash.Config
	opts = {},

	keys = {
		-- stylua: ignore start
		{ 's',  function() require('flash').jump() end, desc = 'Flash', mode = { 'n', 'x', 'o' } },
	},
}
