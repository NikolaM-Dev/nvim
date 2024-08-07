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
			desc = 'Jump to word',
			mode = { 'n', 'v' },
		},
	},
	config = function()
		require('hop').setup({
			keys = 'asdghklqwertyuiopzxcvbnmfj',
		})
	end,
}
