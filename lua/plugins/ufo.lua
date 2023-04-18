return {
	'kevinhwang91/nvim-ufo',
	enabled = false,
	dependencies = 'kevinhwang91/promise-async',
	event = 'BufReadPost',
	init = function()
		vim.keymap.set('n', 'zR', function()
			require('ufo').openAllFolds()
		end, { desc = 'Open All Folds' })
		vim.keymap.set('n', 'zM', function()
			require('ufo').closeAllFolds()
		end, { desc = 'Close All Folds' })
		vim.keymap.set('n', 'zp', function()
			require('ufo').peekFoldedLinesUnderCursor()
		end, { desc = 'Peek Fold' })

		require('ufo').setup({ open_fold_hl_timeout = 40 })
	end,
}
