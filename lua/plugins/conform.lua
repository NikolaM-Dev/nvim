---@type LazySpec
return {
	'stevearc/conform.nvim',
	enabled = true,

	cmd = { 'ConformInfo' },
	event = 'BufWritePre',
	config = function()
		require('conform').setup()
	end,
}
