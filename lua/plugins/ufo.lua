return {
	'kevinhwang91/nvim-ufo',
	dependencies = 'kevinhwang91/promise-async',
	event = 'FileType',
	keys = {
		{
			'zR',
			function()
				require('ufo').openAllFolds()
			end,
			desc = 'Open All Folds',
		},
		{
			'zM',
			function()
				require('ufo').closeAllFolds()
			end,
			desc = 'Close All Folds',
		},
		-- TODO: Add description
		{
			'zr',
			function()
				require('ufo').openFoldsExceptKinds()
			end,
		},
		{
			'zm',
			function()
				require('ufo').closeFoldsWith()
			end,
		},
		{
			'zp',
			function()
				require('ufo').peekFoldedLinesUnderCursor()
			end,
			desc = 'Peek Fold',
		},
	},
	config = function()
		require('ufo').setup({
			open_fold_hl_timeout = 90,
			provider_selector = function(_, filetype, buftype)
				if
					filetype == ''
					or filetype == 'netrw'
					or vim.tbl_contains({ 'help', 'loclist', 'nofile', 'prompt', 'quickfix', 'terminal' }, buftype)
				then
					return ''
				end

				return { 'lsp', 'indent' }
			end,
		})
	end,
}
