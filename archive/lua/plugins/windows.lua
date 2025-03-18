---@type LazySpec
return {
	'anuvyklack/windows.nvim',
	enabled = true,

	event = 'VeryLazy',
	dependencies = 'anuvyklack/middleclass',

	---@type table
	opts = {
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
	},
}
