return {
	'nvim-lualine/lualine.nvim',
	enabled = true,
	event = 'VeryLazy',
	config = function()
		require('lualine').setup({})
	end,
}
