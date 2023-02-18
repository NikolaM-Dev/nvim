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

-- disables autocommenting on new lines
autocmd({ 'FileType' }, {
	group = _G.augroup('disable_autocommenting'),
	pattern = '*',
	callback = function()
		vim.api.nvim_command('setlocal formatoptions-=cro')
	end,
})

-- go tmpl
autocmd({ 'BufWinEnter' }, {
	group = _G.augroup('go_tmpl'),
	pattern = '*.tmpl',
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

-- change NvimTree winbar
autocmd({ 'BufEnter' }, {
	group = _G.augroup('nvim_tree_winbar'),
	pattern = '*',
	callback = function()
		if vim.bo.filetype == 'NvimTree' then
			local colors = require('tokyonight.colors').setup()
			local path = vim.fn.getcwd()
			local val = '%#WinbarNvimTreeIcon#   %*'

			path = path:gsub(vim.env.HOME, '~')
			val = val .. '%#WinbarPath#' .. path .. '%*'
			vim.api.nvim_set_hl(0, 'WinbarNvimTreeIcon', { fg = colors.blue })
			vim.api.nvim_set_hl(0, 'WinbarPath', { fg = colors.magenta, bold = true })
			vim.api.nvim_win_set_option(0, 'winbar', val)
		end
	end,
})

-- q to quit these filetypes
autocmd({ 'FileType' }, {
	group = _G.augroup('close_with_q'),
	pattern = {
		'checkhealth',
		'help',
		'lspinfo',
		'man',
		'notify',
		'PlenaryTestPopup',
		'qf',
		'spectre_panel',
		'startuptime',
		'tsplayground',
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
	end,
})

-- Open in vertical split
autocmd({ 'FileType' }, {
	group = _G.augroup('open_in_right_vertical_split'),
	pattern = { 'help' },
	callback = function()
		vim.cmd.wincmd('L')
	end,
})

-- Fzf redraw
autocmd('VimResized', { pattern = '*', command = 'lua require("fzf-lua").redraw()', group = _G.augroup('fzf_redraw') })

-- Check if we need to reload the file when it changed
autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, { command = 'checktime', group = _G.augroup('checktime') })

-- Resize splits if window got resized
autocmd({ 'VimResized' }, {
	group = _G.augroup('resize_splits'),
	callback = function()
		vim.cmd('tabdo wincmd =')
	end,
})
