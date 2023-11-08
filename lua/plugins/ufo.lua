local handler = function(virtText, lnum, endLnum, width, truncate)
	local curWidth = 0
	local newVirtText = {}
	local suffix = (' 󰁂 %d '):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth

	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)

		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)

			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
			end

			break
		end

		curWidth = curWidth + chunkWidth
	end

	table.insert(newVirtText, { suffix, 'MoreMsg' })

	return newVirtText
end

return {
	'kevinhwang91/nvim-ufo',
	dependencies = 'kevinhwang91/promise-async',
	enabled = true,
	event = 'BufEnter',
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
			fold_virt_text_handler = handler,
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
