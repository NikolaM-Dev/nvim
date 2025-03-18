---@type LazySpec
return {
	'echasnovski/mini.pairs',
	enabled = true,

	event = 'InsertEnter',
	config = function()
		require('mini.pairs').setup()
	end,
}
