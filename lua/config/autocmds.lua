local autocmd = vim.api.nvim_create_autocmd

-- disable default syntax in these file.
-- when file is larged ,load regex syntax
-- highlight will cause very slow
autocmd({ 'Filetype' }, {
	group = _G.augroup('disable_default_sintax'),
	pattern = '*.c,*.cpp,*.lua,*.go,*.rs,*.py,*.ts,*.tsx',
	callback = function()
		vim.api.nvim_command('syntax off')
	end,
})

autocmd({ 'BufEnter' }, {
	desc = 'Disables autocommenting on new lines',
	group = _G.augroup('disable_autocommenting'),
	pattern = '*',
	callback = function()
		vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
	end,
})

autocmd({ 'BufWinEnter' }, {
	desc = 'Change filetype to html for better highlight syntax',
	group = _G.augroup('html_filetype'),
	pattern = { '*.tmpl', '*.snap' },
	callback = function()
		vim.api.nvim_command('set filetype=html')
	end,
})

-- vite enviroment
autocmd({ 'BufWinEnter' }, {
	group = _G.augroup('vite_enviroment'),
	pattern = '.env.*',
	callback = function()
		vim.api.nvim_command('set filetype=sh')
	end,
})

-- highlight yank
autocmd('TextYankPost', {
	group = _G.augroup('highlight_yank'),
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 90,
		})
	end,
})

-- Open in vertical split
autocmd({ 'FileType' }, {
	group = _G.augroup('open_in_right_vertical_split'),
	pattern = { 'gitcommit', 'help', 'man' },
	callback = function()
		vim.cmd.wincmd('L')
	end,
})

-- Check if we need to reload the file when it changed
autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, { command = 'checktime', group = _G.augroup('checktime') })

-- Resize splits if window got resized
autocmd({ 'VimResized' }, {
	group = _G.augroup('resize_splits'),
	callback = function()
		vim.cmd('tabdo wincmd =')
	end,
})

-- Go to last loc when opening a buffer
autocmd('BufReadPre', {
	group = _G.augroup('go_last_loc'),
	pattern = '*',
	callback = function()
		vim.api.nvim_create_autocmd('filetype', {
			pattern = '<buffer>',
			once = true,
			callback = function()
				vim.cmd(
					[[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]
				)
			end,
		})
	end,
})

-- Focus DiffView file panel when opening a gitcommit
vim.api.nvim_create_autocmd('FileType', {
	group = augroup('focus_diff_file_panel'),
	pattern = { 'gitcommit' },
	callback = function(event)
		vim.bo[event.buf].buflisted = false

		vim.keymap.set('n', '<leader>e', function()
			require('utils').go_to_window(1)
		end, { buffer = event.buf, silent = true, desc = 'Go to DiffView file panel' })
	end,
})
