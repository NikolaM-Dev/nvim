---Adds a new |mapping|. By default with silent mode active
---@param mode string|string[] Mode short-name, see |nvim_set_keymap()|.
---							   Can also be list of modes to create mapping on multiple modes.
---@param lhs string           Left-hand side |{lhs}| of the mapping.
---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts? vim.keymap.set.Opts
local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false

	return vim.keymap.set(mode, lhs, rhs, opts)
end

-- Better up/down
map({ 'n', 'x' }, 'j', 'v:count == 0 ? \'gj\' : \'j\'', { expr = true, silent = true })
map({ 'n', 'x' }, 'k', 'v:count == 0 ? \'gk\' : \'k\'', { expr = true, silent = true })

map(
	'n',
	'<leader>,',
	'm\'$a,<Esc>`\'',
	{ desc = 'Put a comma at the other end of the current line and return to last position' }
)

map(
	'n',
	'<leader>.',
	'm\'$a.<Esc>`\'',
	{ desc = 'Put a dot at the other end of the current line and return to last position' }
)

-- Move Lines
map('i', '<A-J>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<A-K>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map('n', '<A-J>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
map('n', '<A-K>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map('v', '<A-J>', ':m \'>+1<cr>gv=gv', { desc = 'Move down' })
map('v', '<A-K>', ':m \'<-2<cr>gv=gv', { desc = 'Move up' })

-- Insert line below
map('i', '<C-o>', '<esc>o')

-- Clear search with <esc>
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- Better indenting
map('v', '<', '<gv', { desc = 'Indent Left' })
map('v', '>', '>gv', { desc = 'Indent right' })

-- Sort
map('v', '<leader>sl', ':sort<cr>', { desc = '[S]ort [L]ines' })

-- Save
map({ 'i', 'n', 's', 'v' }, '<C-s>', '<esc><cmd>w<cr>', { desc = '[S]ave file' })
map('n', '<leader><C-s>', '<cmd>noautocmd w<cr>', { desc = '[S]ave file without auto-indent' })

-- Save all
map('n', '<leader>w', '<cmd>wall<cr>', { desc = 'Write all' })

-- Quit
map('n', '<C-q>', function()
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
map('i', '<C-q>', '<esc><cmd>wq<cr>', { desc = 'Quit' })

-- Quit all
map('n', '<leader>q', '<cmd>qall<cr>', { desc = '[Q]uit all' })
map('n', '<leader><leader>q', '<cmd>qall!<cr>', { desc = '[Q]uit all forced' })

-- Quit without save
map('n', '<leader><leader>z', '<cmd>q!<cr>', { desc = 'Quit without save' })

-- Centralized scroll
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up centralized' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down centralized' })

-- Centralized search
map('n', 'N', 'Nzzzv', { desc = 'Previous centralized' })
map('n', 'n', 'nzzzv', { desc = 'Next search centralized' })

-- Centralized history
map('n', '<C-o>', '<C-o>zz', { desc = 'Previous History centralized' })
map('n', '<C-i>', '<C-i>zz', { desc = 'Next History centralized' })

-- Lazy
map('n', '<leader>lp', '<cmd>Lazy profile<cr>', { desc = 'Lazy profile' })
map('n', '<leader>lu', '<cmd>Lazy update<cr>', { desc = 'Lazy update' })

-- H and L go to begining/end of line
map('n', 'H', '^', { desc = 'Go to Beginning of Line' })
map('n', 'L', '$', { desc = 'Go to End of Line' })

-- Add undo break-points
map('i', '!', '!<c-g>u')
map('i', ',', ',<c-g>u')
map('i', '-', '-<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')
map('i', '?', '?<c-g>u')
map('i', '_', '_<c-g>u')
map('n', 'o', 'o<c-g>u')

-- Paste & replace without copy
map('n', '<leader>Y', [["+Y]])
map({ 'n', 'v' }, '<leader>d', [["_d]])
map({ 'n', 'v' }, '<leader>y', [["+y]])
map('x', '<leader>p', [["_dP]])

-- Change to right vertial split
map('n', '<leader><leader>l', function()
	vim.cmd.wincmd('L')
end, { desc = 'Change to vertial split' })

-- Rename all occurrences in the file
map(
	'n',
	'<leader><leader>s',
	':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',
	{ desc = 'Rename all occurrences in the file', silent = false }
)
map(
	'v',
	'<leader><leader>s',
	':s///gI<Left><Left><Left><Left>',
	{ desc = 'Rename all occurrences in the file (v)', silent = false }
)

map('n', '<leader><leader>;', function()
	require('utils').go_to_window(4)
end, { desc = 'Go to window 4' })

map(
	'n',
	'<leader>rf',
	'<cmd>e<cr>',
	{ desc = '[R]eloads the [F]ile from disk, but will fail if there are unsaved changes' }
)

map(
	'n',
	'<leader>;rf',
	'<cmd>e!<cr>',
	{ desc = '[R]eloads the [F]ile from disk, but forces the reload, discarding any unsaved changes in the buffer' }
)

map('n', '<leader>ip', function()
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

map('n', '<leader>yp', '<cmd>let @+=expand("%:p:~")<cr>', { desc = '[Y]ank [P]ath from current file' })

map('n', '<C-n>', '<cmd>cnext<cr>', { desc = 'Next Quickfix list item' })
map('n', '<C-p>', '<cmd>cprev<cr>', { desc = 'Previous Quickfix list item' })

map('n', '<leader><leader>r', function()
	local cmd = vim.fn.getline('.')

	vim.cmd(cmd)
end, { desc = 'Run command on current line' })

map('n', '<leader>tw', function()
	vim.wo.wrap = not vim.wo.wrap

	if vim.wo.wrap then
		-- logger:info('Word wrap is enabled')
	else
		-- logger:warn('Word wrap is disabled')
	end
end, { desc = '[T]oggle word [W]rap' })

map('n', '<leader>tcl', function()
	local current_value = vim.api.nvim_get_option_value('colorcolumn', {})

	if current_value == '' then
		n.logger:info('Colorcolumn is enabled')
		vim.api.nvim_set_option_value('colorcolumn', '80', {})
	else
		n.logger:warn('Colorcolumn is disabled')
		vim.api.nvim_set_option_value('colorcolumn', '', {})
	end
end, { desc = '[T]oggle Color[C]o[L]umn' })

map('n', '<leader>ts', function()
	n.map.toggle_opt('spell', true, false, 'Spelling')
end, { desc = '[T]oggle [S]pell' })

-- Execute
map('n', '<leader><leader>x', '<cmd>source %<cr>', { desc = 'e[X]ecute current lua file' })
map('n', '<leader>x', '<cr>.lua<cr>', { desc = 'e[X]ecute current lua line' })
map('v', '<leader>x', ':lua<cr>', { desc = 'e[X]ecute selected lua lines' })

vim.api.nvim_create_user_command('TmuxLazyGit', function()
	local command = 'tmux new-window -c "#{pane_current_path}" -n "lazygit" lazygit'

	vim.fn.system(command)
end, { desc = 'Tmux [L]azy[G]it' })

map('n', '<leader>lg', '<cr>TmuxLazyGit<cr>')

vim.api.nvim_create_user_command('TmuxLazyDocker', function()
	local command = 'tmux new-window -c "#{pane_current_path}" -n "lazydocker" lazydocker'

	vim.fn.system(command)
end, { desc = 'Tmux [L]azy[D]ocker' })

map('n', '<leader>ld', '<cmd>TmuxLazyDocker<cr>')

map('i', '<C-z>', '<esc><cmd>b#<cr>', { desc = 'Go to last buffer' })
map('n', '<C-z>', '<cmd>b#<cr>', { desc = 'Go to last buffer' })
