---@type LazySpec
return {
	'supermaven-inc/supermaven-nvim',
	enabled = true,

	event = 'InsertEnter',
	config = function()
		require('supermaven-nvim').setup({})
	end,
}
