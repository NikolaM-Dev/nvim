return {
	'stevearc/dressing.nvim',
	init = function()
		local lazy = require('lazy')

		vim.ui.select = function(...)
			lazy.load({ plugins = { 'dressing.nvim' } })
			return vim.ui.select(...)
		end

		vim.ui.input = function(...)
			lazy.load({ plugins = { 'dressing.nvim' } })
			return vim.ui.input(...)
		end

		require('dressing').setup({
			input = {
				relative = 'editor',
				prefer_width = 60,
			},
		})
	end,
}
