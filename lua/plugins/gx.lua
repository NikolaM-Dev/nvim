---@type LazySpec
return {
	'chrishrb/gx.nvim',
	enabled = true,

	keys = {
		{ 'gx', '<cmd>Browse<cr>', mode = { 'n', 'x' } },
	},
	cmd = { 'Browse' },

	config = true,
}
