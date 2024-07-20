---@type LazySpec
return {
	'stevearc/conform.nvim',
	enabled = true,

	config = function()
		require('conform').setup()
	end,
}
