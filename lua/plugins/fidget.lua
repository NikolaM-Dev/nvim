---@type LazySpec
return {
	'j-hui/fidget.nvim',
	enabled = true,

	event = 'VeryLazy',
	version = '*',
	config = function()
		require('fidget').setup({
			progress = {
				display = {
					done_icon = '󰄳',
				},
			},
			notification = {
				window = {
					winblend = 0,
				},
			},
		})
	end,
}
