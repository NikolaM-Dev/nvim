return {
	'echasnovski/mini.comment',
	dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
	event = 'VeryLazy',
	config = function()
		require('mini.comment').setup({
			hooks = {
				pre = function()
					---@diagnostic disable-next-line: missing-parameter
					require('ts_context_commentstring.internal').update_commentstring()
				end,
			},
		})
	end,
}
