---@type LazySpec
return {
	'smoka7/hop.nvim',
	enabled = true,

	keys = {
		{
			'f',
			'<cmd>HopWord<cr>',
			desc = 'Jump to word',
			mode = { 'n', 'v' },
		},
		{
			'F',
			'<cmd>HopCamelCase<cr>',
			desc = 'Jump to camel case',
			mode = { 'n', 'v' },
		},
		{
			't',
			'<cmd>HopLine<cr>',
			desc = 'Jump to line',
			mode = { 'n', 'v' },
		},
	opts = {
		keys = 'asdghklqwertyuiopzxcvbnmfj',
	},
}
