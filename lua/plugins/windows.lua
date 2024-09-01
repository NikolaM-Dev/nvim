---@type LazySpec
return {
	'anuvyklack/windows.nvim',
	enabled = true,

	event = 'VeryLazy',
	dependencies = 'anuvyklack/middleclass',
	config = function()
		require('windows').setup({
			ignore = {
				buftype = {
					'nofile',
					'quickfix',
					'terminal',
				},
				filetype = {
					'no-neck-pain',
				},
			},
		})
	end,
}
