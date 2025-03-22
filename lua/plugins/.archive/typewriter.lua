---@type LazySpec
return {
	'joshuadanpeterson/typewriter',
	enabled = false,

	cmd = {
		'TWEnable',
		'TWDisable',
		'TWToggle',
		'TWCenter',
		'TWTop',
		'TWBottom',
	},
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
	config = function()
		require('typewriter').setup()
	end,
}
