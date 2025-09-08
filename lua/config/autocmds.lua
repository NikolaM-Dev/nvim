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

-- From https://github.com/chrisgrieser/.config/blob/main/nvim/lua/config/autocmds.lua
local function close_buffers()
	local closedBuffers = {}
	local allBufs = vim.fn.getbufinfo({ buflisted = 1 })

	vim.iter(allBufs):each(function(buf)
		if not vim.api.nvim_buf_is_valid(buf.bufnr) then
			return
		end

		local stillExists = vim.uv.fs_stat(buf.name) ~= nil
		local specialBuffer = vim.bo[buf.bufnr].buftype ~= ''
		local newBuffer = buf.name == ''

		if stillExists or specialBuffer or newBuffer then
			return
		end

		table.insert(closedBuffers, vim.fs.basename(buf.name))
		vim.api.nvim_buf_delete(buf.bufnr, { force = false })
	end)
	if #closedBuffers == 0 then
		return
	end

	if #closedBuffers == 1 then
		vim.notify(closedBuffers[1], nil, { title = 'Buffer closed', icon = '  ' })
	else
		local text = '- ' .. table.concat(closedBuffers, '\n- ')
		vim.notify(text, nil, { title = 'Buffers closed', icon = '󰅗' })
	end

	-- If ending up in empty buffer, re-open the first oldfile that exists
	vim.defer_fn(function()
		if vim.api.nvim_buf_get_name(0) ~= '' then
			return
		end

		for _, file in ipairs(vim.v.oldfiles) do
			if vim.uv.fs_stat(file) and vim.fs.basename(file) ~= 'COMMIT_EDITMSG' then
				vim.cmd.edit(file)
				return
			end
		end
	end, 1)
end

autocmd({ 'FocusGained' }, {
	desc = 'Close all non-existing buffers on `FocusGained`.',
	group = augroup('close_all_non-existing_buffers_on_focus_gained'),
	callback = close_buffers,
})
	callback = function()
		close_buffers()
	end,
})

-- From https://github.com/chrisgrieser/.config/blob/main/nvim/lua/config/autocmds.lua
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
