local map, logger = n.map, n.logger:new('Keymaps')

-- Better up/down
map.set({ 'n', 'x' }, 'j', 'v:count == 0 ? \'gj\' : \'j\'', { expr = true, silent = true })
map.set({ 'n', 'x' }, 'k', 'v:count == 0 ? \'gk\' : \'k\'', { expr = true, silent = true })

map.set(
	'n',
	'<leader>,',
	'm\'$a,<Esc>`\'',
	{ desc = 'Put a comma at the other end of the current line and return to last position' }
)

map.set(
	'n',
	'<leader>.',
	'm\'$a.<Esc>`\'',
	{ desc = 'Put a dot at the other end of the current line and return to last position' }
)

-- Move Lines
map.set('i', '<A-J>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map.set('i', '<A-K>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map.set('n', '<A-J>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
map.set('n', '<A-K>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map.set('v', '<A-J>', ':m \'>+1<cr>gv=gv', { desc = 'Move down' })
map.set('v', '<A-K>', ':m \'<-2<cr>gv=gv', { desc = 'Move up' })

-- Insert line below
map.set('i', '<C-o>', '<esc>o')

-- Clear search with <esc>
map.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- Better indenting
map.set('v', '<', '<gv', { desc = 'Indent Left' })
map.set('v', '>', '>gv', { desc = 'Indent right' })

-- Sort
map.set('v', '<leader>s', ':!sort<cr>', { desc = 'Sort' })

-- Save
map.set({ 'i', 'n', 's', 'v' }, '<C-s>', '<esc><cmd>w<cr>', { desc = '[S]ave file' })
map.set('n', '<leader><C-s>', map.cmd('noautocmd w'), { desc = '[S]ave file without auto-indent' })

-- Save all
map.set('n', '<leader>w', map.cmd('wall'), { desc = 'Write all' })

-- Quit
map.set('n', '<C-q>', function()
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
map.set('i', '<C-q>', '<esc><cmd>wq<cr>', { desc = 'Quit' })

-- Quit all
map.set('n', '<leader>q', map.cmd('qall'), { desc = '[Q]uit all' })
map.set('n', '<leader><leader>q', map.cmd('qall!'), { desc = '[Q]uit all forced' })

-- Quit without save
map.set('n', '<leader><leader>z', map.cmd('q!'), { desc = 'Quit without save' })

-- Centralized scroll
map.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up centralized' })
map.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down centralized' })

-- Centralized search
map.set('n', 'N', 'Nzzzv', { desc = 'Previous centralized' })
map.set('n', 'n', 'nzzzv', { desc = 'Next search centralized' })

-- Centralized history
map.set('n', '<C-o>', '<C-o>zz', { desc = 'Previous History centralized' })
map.set('n', '<C-i>', '<C-i>zz', { desc = 'Next History centralized' })

-- Lazy
map.set('n', '<leader>lp', map.cmd('Lazy profile'), { desc = 'Lazy profile' })
map.set('n', '<leader>lu', map.cmd('Lazy update'), { desc = 'Lazy update' })

-- H and L go to begining/end of line
map.set('n', 'H', '^', { desc = 'Go to Beginning of Line' })
map.set('n', 'L', '$', { desc = 'Go to End of Line' })

-- Add undo break-points
map.set('i', '!', '!<c-g>u')
map.set('i', ',', ',<c-g>u')
map.set('i', '-', '-<c-g>u')
map.set('i', '.', '.<c-g>u')
map.set('i', ';', ';<c-g>u')
map.set('i', '?', '?<c-g>u')
map.set('i', '_', '_<c-g>u')
map.set('n', 'o', 'o<c-g>u')

-- Paste & replace without copy
map.set('n', '<leader>Y', [["+Y]])
map.set({ 'n', 'v' }, '<leader>d', [["_d]])
map.set({ 'n', 'v' }, '<leader>y', [["+y]])
map.set('x', '<leader>p', [["_dP]])

-- Change to right vertial split
map.set('n', '<leader><leader>l', function()
	vim.cmd.wincmd('L')
end, { desc = 'Change to vertial split' })

-- Rename all occurrences in the file
map.set(
	'n',
	'<leader><leader>s',

	map.cmd('%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { delay_cmd = true }),
	{ desc = 'Rename all occurrences in the file', silent = false }
)
map.set(
	'v',
	'<leader><leader>s',
	map.cmd('s///gI<Left><Left><Left><Left>', { delay_cmd = true }),
	{ desc = 'Rename all occurrences in the file (v)', silent = false }
)

map.set('n', '<leader><leader>;', function()
	require('utils').go_to_window(4)
end, { desc = 'Go to window 4' })

map.set(
	'n',
	'<leader>rf',
	map.cmd('e'),
	{ desc = '[R]eloads the [F]ile from disk, but will fail if there are unsaved changes' }
)

map.set(
	'n',
	'<leader>;rf',
	map.cmd('e!'),
	{ desc = '[R]eloads the [F]ile from disk, but forces the reload, discarding any unsaved changes in the buffer' }
)

map.set('n', '<leader>ip', function()
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

map.set('n', '<leader>yp', map.cmd('let @+=expand("%:p:~")'), { desc = '[Y]ank [P]ath from current file' })

map.set('n', '<M-j>', map.cmd('cnext'), { desc = 'Next Quickfix list item' })
map.set('n', '<M-k>', map.cmd('cprev'), { desc = 'Previous Quickfix list item' })
map.set('n', '<leader><leader>r', function()
	local cmd = vim.fn.getline('.')

	vim.cmd(cmd)
end, { desc = 'Run command on current line' })

map.set('n', '<leader>tw', function()
	vim.wo.wrap = not vim.wo.wrap

	if vim.wo.wrap then
		logger:info('Word wrap is enabled')
	else
		logger:warn('Word wrap is disabled')
	end
end, { desc = '[T]oggle word [W]rap' })

map.set('n', '<leader>tcl', function()
	local current_value = vim.api.nvim_get_option_value('colorcolumn', {})

	if current_value == '' then
		n.logger:info('Colorcolumn is enabled')
		vim.api.nvim_set_option_value('colorcolumn', '80', {})
	else
		n.logger:warn('Colorcolumn is disabled')
		vim.api.nvim_set_option_value('colorcolumn', '', {})
	end
end, { desc = '[T]oggle Color[C]o[L]umn' })

map.set('n', '<leader>ts', function()
	n.map.toggle_opt('spell', true, false, 'Spelling')
end, { desc = '[T]oggle [S]pell' })

-- Execute
map.set('n', '<leader><leader>x', map.cmd('source %'), { desc = 'e[X]ecute current lua file' })
map.set('n', '<leader>x', map.cmd('.lua'), { desc = 'e[X]ecute current lua line' })
map.set('v', '<leader>x', ':lua<cr>', { desc = 'e[X]ecute selected lua lines' })

vim.api.nvim_create_user_command('TmuxLazyGit', function()
	local command = 'tmux new-window -c "#{pane_current_path}" -n "lazygit" lazygit'

	vim.fn.system(command)
end, { desc = 'Git commit amend in Tmux' })

map.set('n', '<leader>lg', map.cmd('TmuxLazyGit'))

map.set('i', '<C-z>', map.cmd('b#', { use_esc = true }), { desc = 'Go to last buffer' })
map.set('n', '<C-z>', map.cmd('b#'), { desc = 'Go to last buffer' })
