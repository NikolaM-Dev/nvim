local augroup = nkl.augroup

local autocmd = vim.api.nvim_create_autocmd

nkl.second_brain.create_format_headings_autocmd()
autocmd({ 'BufEnter' }, {
	desc = 'Disables autocommenting on new lines',
	group = augroup('disables_autocommenting_on_new_lines'),
	pattern = '*',
	callback = function()
		-- Don't add a new comment with using `o` or `O`
		vim.opt.formatoptions:remove({ 'o' })
	end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
	desc = 'Enable NoNeckPain from start',
	group = augroup('enable_noneckpain_from_start'),
	once = true,
	callback = function()
		-- Skips snacks dashboard
		if vim.bo.filetype ~= 'snacks_dashboard' then
			vim.cmd('NoNeckPain')
		end
	end,
})
autocmd('TextYankPost', {
	desc = 'Highlight yank',
	group = augroup('highlight_yank'),
	callback = function()
		vim.hl.on_yank({ timeout = 200 })
	end,
})

autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
	desc = 'Check if we need to reload the file when it changed',
	group = augroup('check_if_we_need_to_reload_the_file_when_it_changed'),
	callback = function()
		if vim.o.buftype ~= 'nofile' then
			vim.cmd('checktime')
		end
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

-- TODO: Denote nvim try
autocmd({ 'BufWritePost' }, {
	callback = function()
		if true then
			return
		end

		local second_brain_path = os.getenv('SECOND_BRAIN_PATH')
		local cwd = vim.fn.getcwd()
		local filetype = vim.bo.filetype

		if filetype ~= 'markdown' then
			return
		end

		if cwd ~= second_brain_path then
			return
		end

		vim.system(
			{ '/home/nikola/w/1-projects/sb-renamer.py/second-brain-rename', vim.api.nvim_buf_get_name(0) },
			{},
			vim.schedule_wrap(
				---@param out vim.SystemCompleted
				function(out)
					local stdout = vim.fn.split(out.stdout, '\n')

					if stdout[1] == 'No updates required' then
						return
					end

					local new_filename = stdout[#stdout]
					vim.cmd('e ' .. vim.fn.expand('%:p:h') .. '/' .. new_filename)
					vim.cmd('ZkIndex')
					vim.cmd('LspRestart')
					-- Snacks.bufdelete.other()
					close_buffers()
				end
			)
		)
	end,
})

---https://github.com/chrisgrieser/.config/blob/6e5e7841959612a9aec4b8e8801779316c2c224d/nvim/lua/config/autocmds.lua#L122-L144
autocmd({ 'BufLeave', 'FocusLost', 'InsertLeave', 'TextChanged' }, {
	desc = 'Auto save',
	group = augroup('auto_save'),
	callback = function(ctx)
		local save_instantly = ctx.event == 'FocusLost'
		local bufnr = ctx.buf
		local bo, b = vim.bo[bufnr], vim.b[bufnr]
		local bufname = ctx.file

		if bo.buftype ~= '' or bo.ft == 'gitcommit' or bo.readonly then
			return
		end

		if b.save_queued and not save_instantly then
			return
		end

		b.save_queued = true
		vim.defer_fn(function()
			if not vim.api.nvim_buf_is_valid(bufnr) then
				return
			end

			vim.api.nvim_buf_call(bufnr, function()
				-- saving with explicit name prevents issues when changing `cwd`
				-- `:update!` suppresses "The file has been changed since reading it!!!"
				vim.cmd(string.format('silent! noautocmd lockmarks update! %q', bufname))
			end)

			b.save_queued = false
		end, save_instantly and 0 or 2000)
	end,
})
