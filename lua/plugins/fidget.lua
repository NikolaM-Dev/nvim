return {
	'j-hui/fidget.nvim',
	event = 'VeryLazy',
	tag = 'legacy',
	config = function()
		require('fidget').setup({
			sources = { ['null-ls'] = { ignore = true } },
			text = { done = '󰄳', spinner = 'dots' },
			window = { blend = 0 },
		})
	end,
}
