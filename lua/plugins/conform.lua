---@type LazySpec
return {
	'stevearc/conform.nvim',
	enabled = true,

	cmd = { 'ConformInfo' },
	event = 'BufWritePre',
	config = function()
		require('conform').setup()
	---@param opts conform.setupOpts
	config = function(_, opts)
		require('conform').setup(opts)
	end,
}
