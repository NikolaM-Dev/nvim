local dmap, map = nkl.key.dmap, nkl.key.map

-- TODO: :silent mkspell! %, to generate spell files

dmap({ 'i', 's' }, '<C-s>', { desc = 'Delete to use <C-s> to save in insert mode' })
dmap({ 'n' }, '[d', { desc = 'Delete to use to jump to the previous diagnostic' })
dmap({ 'n' }, ']d', { desc = 'Delete to use to jump to the next diagnostic' })
dmap({ 'n' }, 'grr', { desc = 'Delete default references keymap to use a picker based' })

map('ia', 'ellip', '…')

map('n', '<C-s>', '<cmd>write<cr>', { desc = 'Write buffer' })
map('n', '<leader><C-s>', '<cmd>wall<cr>', { desc = 'Write All changed buffers' })
map({ 'i', 'x' }, '<C-s>', '<esc><cmd>write<cr>', { desc = 'Write buffer' })
map('n', 'ZS', '<cmd>wall | qa<cr>', { desc = 'Write All changed buffers and quits' })
map('n', 'ZX', '<cmd>qa!<cr>', { desc = 'Bails out of everything' })

map('n', '<leader>lG', function()
	vim.fn.system('tmux new-window -c "#{pane_current_path}" -n "   " lazygit')
end, { desc = '[L]azy [G]it using Tmux' })

map('n', '<leader>ld', function()
	vim.fn.system('tmux new-window -c "#{pane_current_path}" -n "   " lazydocker')
end, { desc = '[L]azy [D]ocker using Tmux' })

map('v', '<', '<gv', { desc = 'Continuos Indent Left' })
map('v', '>', '>gv', { desc = 'Continuos Indent Right' })

map('n', '<C-n>', '<cmd>cnext<cr>', { desc = '[N]ext QFList' })
map('n', '<C-p>', '<cmd>cprevious<cr>', { desc = '[P]revious QFList' })

map('n', '<C-q>', function()
	-- Close gitsigns diffthis buffer
	if is_in_gitsigns_diffthis then
		vim.cmd('wincmd p')
		_G.is_in_gitsigns_diffthis = false
	end

	vim.cmd.quit()
end, { desc = '[Q]uit' })
map('i', '<C-q>', '<cmd>x<cr>', { desc = '[Q]uit' })
map('n', '<leader><C-q>', ':wqall<cr>', { desc = 'Write and [Q]uit All Buffers' })
map('n', '<backspace><C-q>', ':qall!<cr>', { desc = '[Q]uit All Buffers Forced' })

map('i', '!', '!<C-g>u', { desc = 'Add undo break after type !' })
map('i', ',', ',<C-g>u', { desc = 'Add undo break after type ,' })
map('i', '-', '-<C-g>u', { desc = 'Add undo break after type -' })
map('i', '.', '.<C-g>u', { desc = 'Add undo break after type .' })
map('i', ';', ';<C-g>u', { desc = 'Add undo break after type ;' })
map('i', '?', '?<C-g>u', { desc = 'Add undo break after type ?' })
map('i', '_', '_<C-g>u', { desc = 'Add undo break after type _' })
map('n', 'o', 'o<C-g>u', { desc = 'Add undo break after type o' })

map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up centralized' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down centralized' })

map('n', 'N', 'Nzzzv', { desc = 'Previous centralized' })
map('n', 'n', 'nzzzv', { desc = 'Next search centralized' })

map('n', '<C-o>', '<C-o>zz', { desc = 'Previous History centralized' })
map('n', '<C-i>', '<C-i>zz', { desc = 'Next History centralized' })

map('n', '*', '*zz', { desc = 'Search forward for the word under the cursor centralized' })
map('n', '#', '#zz', { desc = 'Search backward for the word under the cursor centralized' })
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

map('x', '<leader>sl', ':sort<cr>', { desc = '[S]ort [L]ines' })

-- NOTE: Somethings is helpful
-- map({ 'n', 'v', 'o' }, '<C-z>', '<Nop>', { desc = 'Disable <C-z> suspend' })

local use_virtual_lines = true
vim.api.nvim_create_user_command('ToggleUseVirtualLines', function()
	use_virtual_lines = not use_virtual_lines
	local title = 'Options'

	if use_virtual_lines then
		Snacks.notify.info('Virtual Lines Enable', { title = title })
	else
		Snacks.notify.warn('Virtual Lines Disabled', { title = title })
	end
end, {})

map('n', 'j', function()
	if not use_virtual_lines then
		return 'j'
	end

	return vim.v.count > 1 and 'j' or 'gj'
end, { expr = true, desc = 'Go down dwim' })

map('n', 'k', function()
	if not use_virtual_lines then
		return 'k'
	end

	return vim.v.count > 0 and 'k' or 'gk'
end, { expr = true, desc = 'Go up dwim' })

map('n', '<leader>cmx', function()
	local current_filename = vim.fn.expand('%')
	local escaped_filename = vim.fn.shellescape(current_filename)

	local command_output = vim.fn.system('chmod u+x ' .. escaped_filename)
	local exit_code = vim.v.shell_error -- Check the exit code of the last system command

	if exit_code ~= 0 then
		Snacks.notify.error('Failed to change file permissions: ' .. vim.fn.fnamemodify(current_filename, ':t'))
		Snacks.notify.error('Error details: ' .. command_output)

		return
	end

	Snacks.notify.info('File now has user execution permissions: ' .. vim.fn.fnamemodify(current_filename, ':t'))
end, { desc = '[C]h[M]od +[X]' })

map('n', '<leader>fd', function()
	local current_filename = vim.fn.expand('%:p') -- Get full path
	local escaped_filename = vim.fn.shellescape(current_filename)

	if current_filename == '' then
		Snacks.notify.warn('No file in current buffer to delete.')
		return
	end

	Snacks.input({
		prompt = ('Are you sure you want to delete "%s"? [y/N]'):format(vim.fn.fnamemodify(current_filename, ':t')),
	}, function(answer)
		local confirmed_answer = answer:lower()
		if confirmed_answer == 'y' then
			-- Execute gio trash silently and get its exit status
			local command_output = vim.fn.system('gio trash ' .. escaped_filename)
			local exit_code = vim.v.shell_error -- Check the exit code of the last system command

			if exit_code == 0 then
				-- File moved to trash successfully
				Snacks.notify.info('File deleted successfully: ' .. vim.fn.fnamemodify(current_filename, ':t'))

				-- Check if the deleted file's buffer is the current one
				local current_buffer_name = vim.fn.bufname('%')
				if current_filename == current_buffer_name then
					-- If it is, close the buffer
					-- Use 'bd!' to delete the buffer without saving, even if it's the last window.
					-- You might want to adjust this behavior (e.g., :close if you want to keep window)
					vim.cmd('bd!')
					-- If after bd! there are no buffers, open a new empty one
					if vim.fn.bufnr('$') == 0 then
						vim.cmd('enew')
					end
				else
					-- If the deleted file wasn't the current buffer, just reload the buffer list
					-- (This is more for scenarios where you might have multiple open,
					-- and one in the background was deleted by other means).
					-- For a direct deletion of the current file, 'bd!' is usually sufficient.
				end
			else
				-- gio trash failed
				Snacks.notify.error('Failed to delete file: ' .. vim.fn.fnamemodify(current_filename, ':t'))
				Snacks.notify.error('Error details: ' .. command_output) -- Show actual error
			end
		else
			Snacks.notify.notify('File deletion skipped.')
		end
	end)
end, { desc = '[D]elete [File]' })

-- NOTE: To restart plugins
-- map('n', '<leader>rr', function()
-- 	require('lazy.core.loader').reload('modeline.nvim')
-- end, { desc = 'reload' })

-- NOTE: To restart plugins
-- map('n', '<leader>grn', function()
-- 	vim.system(
-- 		{
-- 			'/home/nikola/w/1-projects/sb-renamer.py/second-brain-rename',
-- 			vim.api.nvim_buf_get_name(0),
-- 		},
-- 		{},
-- 		vim.schedule_wrap(
-- 			---@param out vim.SystemCompleted
-- 			function(out)
-- 				local stdout = vim.fn.split(out.stdout, '\n')
--
-- 				if stdout[1] == 'No updates required' then
-- 					return
-- 				end
--
-- 				local new_filename = stdout[#stdout]
-- 				vim.cmd('e ' .. vim.fn.expand('%:p:h') .. '/' .. new_filename)
-- 				vim.cmd('ZkIndex')
-- 				vim.cmd('LspRestart')
-- 				Snacks.bufdelete.other()
-- 			end
-- 		)
-- 	)
-- end, { desc = '[R]ename note' })

map('t', '<C-w>h', '<cmd>wincmd h<CR>', { desc = 'Change Focus to Left Window' })
map('t', '<C-w>j', '<cmd>wincmd j<CR>', { desc = 'Change Focus to Down Window' })
map('t', '<C-w>k', '<cmd>wincmd k<CR>', { desc = 'Change Focus to Top Window' })
map('t', '<C-w>l', '<cmd>wincmd l<CR>', { desc = 'Change Focus to Right Window' })

map('v', 'J', ':m \'>+1<CR>gv=gv', { desc = 'Move Line/s Down' })
map('v', 'K', ':m \'<-2<CR>gv=gv', { desc = 'Move Line/s Up' })

map('n', '<leader><leader>x', '<cmd>source %<cr>', { desc = 'e[X]ecute current lua file' })
map('n', '<leader>x', '<cr>.lua<cr>', { desc = 'e[X]ecute current lua line' })
map('v', '<leader>x', ':lua<cr>', { desc = 'e[X]ecute selected lua lines' })
map('n', '<leader>fcc', function()
	local logger = nkl.logger:new('Keymaps')
	local buf = vim.api.nvim_buf_get_name(0)
	if buf == '' then
		logger:error('No file in buffer')
		return
	end

	local absolute_path = vim.fn.fnamemodify(buf, ':p')
	vim.fn.setreg('+', absolute_path)
	logger:info(string.format('%s copied', absolute_path))
end, { desc = '  [F]ile [C]opy Absolute Path' })

map('n', '<M-m>', nkl.second_brain.move_note, { desc = '󰪹 Move current file to another directory' })
map('n', '<M-r>', nkl.second_brain.rename_note, { desc = ' Rename note and change it\'s ocurrencies' })
