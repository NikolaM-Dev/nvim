---@type LazySpec
return {
	'stevearc/conform.nvim',
	enabled = true,

	event = 'BufWritePre',
	config = function()
		require('conform').setup()
	end,
}
