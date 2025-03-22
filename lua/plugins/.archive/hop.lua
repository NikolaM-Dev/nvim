---@type LazySpec
return {
	'smoka7/hop.nvim',
	enabled = false,

	keys = {
		{
			';f',
			'<cmd>HopChar1<cr>',
			desc = 'Jump to word',
			mode = { 'n', 'v' },
		},
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
		{
			'T',
			'<cmd>HopVertical<cr>',
			desc = 'Jump to vertial line',
			mode = { 'n', 'v' },
		},
	},

	opts = {
		keys = 'asdfghjklqwertyuiopzxcvbnm',
	},
}
