return {
	'kevinhwang91/nvim-bqf',
	event = 'VeryLazy',
	config = function()
		---@diagnostic disable: missing-fields
		require('bqf').setup({
			preview = {
				winblend = 0,
			},
		})
	end,
}
