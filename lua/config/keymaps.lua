local Map = require('lib.map')

-- Better up/down
Map:set({ 'n', 'x' }, 'j', 'v:count == 0 ? \'gj\' : \'j\'', { expr = true, silent = true })
Map:set({ 'n', 'x' }, 'k', 'v:count == 0 ? \'gk\' : \'k\'', { expr = true, silent = true })

-- Move Lines
Map:set('i', '<A-J>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
Map:set('i', '<A-K>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
Map:set('n', '<A-J>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
Map:set('n', '<A-K>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
Map:set('v', '<A-J>', ':m \'>+1<cr>gv=gv', { desc = 'Move down' })
Map:set('v', '<A-K>', ':m \'<-2<cr>gv=gv', { desc = 'Move up' })

-- Insert line below
Map:set('i', '<C-o>', '<esc>o')

-- Clear search with <esc>
Map:set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- Better indenting
Map:set('v', '<', '<gv', { desc = 'Indent Left' })
Map:set('v', '>', '>gv', { desc = 'Indent right' })

-- Sort
Map:set('v', '<leader>s', ':!sort<cr>', { desc = 'Sort' })

-- Save
Map:set({ 'i', 'n', 's', 'v' }, '<C-s>', '<esc><cmd>w<cr>', { desc = '[S]ave file' })
Map:set('n', '<leader><C-s>', Map:cmd('noautocmd w'), { desc = '[S]ave file without auto-indent' })

-- Save all
Map:set('n', '<leader>w', Map:cmd('wall'), { desc = 'Write all' })

-- Quit
Map:set('n', '<C-q>', function()
	if vim.bo.filetype == 'gitcommit' then
		return vim.cmd.quit()
	end

	if #vim.fn.gettabinfo() > 1 then
		return vim.cmd.tabclose()
	end

	if #vim.fn.gettabinfo()[1].windows > 1 then
		local buffers = vim.fn.getbufinfo()
		local flag = false

		for _, b in pairs(buffers) do
			if string.find(b.name, 'gitsigns://') then
				vim.api.nvim_buf_call(b.bufnr, function()
					vim.cmd.bdelete()
					flag = true
				end)

				break
			end
		end

		if flag then
			return
		end
	end

	vim.cmd.quit()
end, { desc = 'Quit' })

-- Quit & save
Map:set('i', '<C-q>', '<esc><cmd>wq<cr>', { desc = 'Quit' })

-- Quit all
Map:set('n', '<leader>q', Map:cmd('qall'), { desc = '[Q]uit all' })
Map:set('n', '<leader><leader>q', Map:cmd('qall!'), { desc = '[Q]uit all forced' })

-- Quit without save
Map:set('n', '<leader>z', Map:cmd('q!'), { desc = 'Quit without save' })

-- Centralized scroll
Map:set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up centralized' })
Map:set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down centralized' })

-- Centralized search
Map:set('n', 'N', 'Nzzzv', { desc = 'Previous centralized' })
Map:set('n', 'n', 'nzzzv', { desc = 'Next search centralized' })

-- Centralized history
Map:set('n', '<C-o>', '<C-o>zz', { desc = 'Previous History centralized' })
Map:set('n', '<C-i>', '<C-i>zz', { desc = 'Next History centralized' })

-- Lazy
Map:set('n', '<leader>lp', Map:cmd('Lazy profile'), { desc = 'Lazy profile' })
Map:set('n', '<leader>lu', Map:cmd('Lazy update'), { desc = 'Lazy update' })

-- H and L go to begining/end of line
Map:set('n', 'H', '^', { desc = 'Go to Beginning of Line' })
Map:set('n', 'L', '$', { desc = 'Go to End of Line' })

-- Add undo break-points
Map:set('i', '!', '!<c-g>u')
Map:set('i', ',', ',<c-g>u')
Map:set('i', '-', '-<c-g>u')
Map:set('i', '.', '.<c-g>u')
Map:set('i', ';', ';<c-g>u')
Map:set('i', '?', '?<c-g>u')
Map:set('i', '_', '_<c-g>u')

-- Paste & replace without copy
Map:set('n', '<leader>Y', [["+Y]])
Map:set({ 'n', 'v' }, '<leader>d', [["_d]])
Map:set({ 'n', 'v' }, '<leader>y', [["+y]])
Map:set('x', '<leader>p', [["_dP]])

-- Change to right vertial split
Map:set('n', '<leader><leader>l', function()
	vim.cmd.wincmd('L')
end, { desc = 'Change to vertial split' })

-- Rename all occurrences in the file
Map:set(
	'n',
	'<leader><leader>s',

	Map:cmd('%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { delay_cmd = true }),
	{ desc = 'Rename all occurrences in the file', silent = false }
)
Map:set(
	'v',
	'<leader><leader>s',
	Map:cmd('s///gI<Left><Left><Left><Left>', { delay_cmd = true }),
	{ desc = 'Rename all occurrences in the file (v)', silent = false }
)

Map:set('n', '<leader><leader>;', function()
	require('utils').go_to_window(4)
end, { desc = 'Go to window 4' })

Map:set('n', '<leader><leader>', Map:cmd('luafile %'), { desc = 'Reload Lua File' })

Map:set(
	'n',
	'<leader>rf',
	Map:cmd('e'),
	{ desc = '[R]eloads the [F]ile from disk, but will fail if there are unsaved changes' }
)

Map:set(
	'n',
	'<leader>;rf',
	Map:cmd('e!'),
	{ desc = '[R]eloads the [F]ile from disk, but forces the reload, discarding any unsaved changes in the buffer' }
)

Map:set('n', '<leader>ip', function()
	local line_number = vim.api.nvim_win_get_cursor(0)[1]
	local line_content = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]

	local function extract_path(cadena)
		local path = cadena:match('%((.-)%)')

		return path
	end

	local image_path = extract_path(line_content)
	local command = 'wezterm cli split-pane --right --percent 60 -- bash -c \'wezterm imgcat /home/nikola/Documents/second-brain.md/"'
		.. image_path
		.. '"; read\''

	os.execute(command)
end, { desc = '[I]mage [P]review' })

Map:set('n', '<leader>yp', Map:cmd('let @+=expand("%:p:~")'), { desc = '[Y]ank [P]ath from current file' })

Map:set('n', '<leader>xj', Map:cmd('cnext'), { desc = 'Next Quickfix list item' })
Map:set('n', '<leader>xk', Map:cmd('cprev'), { desc = 'Previous Quickfix list item' })
