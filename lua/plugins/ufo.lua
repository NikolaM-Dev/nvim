return {
	'kevinhwang91/nvim-ufo',
	dependencies = 'kevinhwang91/promise-async',
	event = 'BufReadPost',
	init = function()
		vim.keymap.set('n', 'zR', function()
			require('ufo').openAllFolds()
		end)
		vim.keymap.set('n', 'zM', function()
			require('ufo').closeAllFolds()
		end)

		require('ufo').setup({ open_fold_hl_timeout = 40 })
	end,
}
