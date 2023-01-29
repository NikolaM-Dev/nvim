return {
	'stevearc/dressing.nvim',
	init = function()
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.select = function(...)
			require('lazy').load({ plugins = { 'dressing.nvim' } })
			return vim.ui.select(...)
		end
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.input = function(...)
			require('lazy').load({ plugins = { 'dressing.nvim' } })
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
