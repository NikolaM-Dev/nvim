nkl.key.bmap('n', 'grn', function()
	local is_loc_list = vim.fn.getloclist(0, { winid = 0 }).winid == 0
	if is_loc_list then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':cdo s//g<left><left>', true, false, true), 'n', false)
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':ldo s//gc<left><left>', true, false, true), 'n', false)
	end
end, { desc = ' Rename' })

nkl.key.bmap('n', '<C-q>', '<cmd>cclose<cr>', { desc = ' Quit' })
