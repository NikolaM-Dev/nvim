return {
	'kevinhwang91/nvim-bqf',
	event = 'VeryLazy',
	config = function()
		---@diagnostic disable: missing-fields
		require('bqf').setup({
			func_map = {
				filter = ';c', -- choose
				filterr = ';r', -- remove
				pscrolldown = '<C-d>',
				pscrollup = '<C-u>',
				ptoggleitem = '',
			},
			preview = { winblend = 0 },
		})
	end,
}
