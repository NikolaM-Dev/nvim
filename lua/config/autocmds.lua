local augroup = require('lib').augroup

local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
	desc = 'Highlight yank',
	group = augroup('highlight_yank'),
	callback = function()
		vim.hl.on_yank({ timeout = 200 })
	end,
})

autocmd({ 'BufWritePre' }, {
	command = [[%s/\s\+$//e]],
	desc = 'Remove trailing whitespace',
	group = augroup('remove_trailing_whitespace'),
	pattern = '*',
})
autocmd({ 'BufLeave', 'FocusLost', 'InsertLeave', 'TextChanged' }, {
	desc = 'Auto save',
	group = augroup('auto_save'),
	callback = function(ctx)
		local saveInstantly = ctx.event == 'FocusLost' or ctx.event == 'BufLeave'
		local bufnr = ctx.buf
		local bo, b = vim.bo[bufnr], vim.b[bufnr]
		local bufname = ctx.file

		if bo.buftype ~= '' or bo.ft == 'gitcommit' or bo.readonly then
			return
		end

		if b.saveQueued and not saveInstantly then
			return
		end

		b.saveQueued = true
		vim.defer_fn(function()
			if not vim.api.nvim_buf_is_valid(bufnr) then
				return
			end

			vim.api.nvim_buf_call(bufnr, function()
				-- saving with explicit name prevents issues when changing `cwd`
				-- `:update!` suppresses "The file has been changed since reading it!!!"
				local vimCmd = ('silent! noautocmd lockmarks update! %q'):format(bufname)
				vim.cmd(vimCmd)
			end)
			b.saveQueued = false
		end, saveInstantly and 0 or 2000)
	end,
})
