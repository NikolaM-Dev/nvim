---@module 'lazy.types'
---@type LazyPluginSpec
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

		-- { '<C-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
		-- { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
		-- { 'S', mode = { 'n', 'o', 'x' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
		-- { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
	},
}
