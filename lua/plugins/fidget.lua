return {
	'j-hui/fidget.nvim',
	event = 'VeryLazy',
	config = function()
		require('fidget').setup({
			text = { done = '', spinner = 'dots' },
			window = { blend = 0 },
		})
	end,
}
