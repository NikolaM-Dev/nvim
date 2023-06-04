return {
	'echasnovski/mini.comment',
	event = 'VeryLazy',
	dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
	opts = {
		options = {
			custom_commentstring = function()
				---@diagnostic disable-next-line: missing-parameter
				return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
			end,
		},
	},
}
