return {
	'echasnovski/mini.splitjoin',
	event = 'VeryLazy',
	config = function()
		require('mini.splitjoin').setup({ mappings = { toggle = '<leader>j' } })
	end,
}
