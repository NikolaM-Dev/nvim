---@type LazySpec
return {
	'smoka7/hop.nvim',
	enabled = false,

	keys = {
		{
			';f',
			n.map.cmd('HopChar1'),
			desc = 'Jump to word',
			mode = { 'n', 'v' },
		},
		{
			'f',
			n.map.cmd('HopWord'),
			desc = 'Jump to word',
			mode = { 'n', 'v' },
		},
		{
			'F',
			n.map.cmd('HopCamelCase'),
			desc = 'Jump to camel case',
			mode = { 'n', 'v' },
		},
		{
			't',
			n.map.cmd('HopLine'),
			desc = 'Jump to line',
			mode = { 'n', 'v' },
		},
		{
			'T',
			n.map.cmd('HopVertical'),
			desc = 'Jump to vertial line',
			mode = { 'n', 'v' },
		},
	},

	opts = {
		keys = 'asdfghjklqwertyuiopzxcvbnm',
	},
}
