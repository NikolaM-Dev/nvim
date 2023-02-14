local status_ok, _ = pcall(require, 'tokyonight')
if not status_ok then
	return
end

local autocmd = vim.api.nvim_create_autocmd

-- disable default syntax in these file.
-- when file is larged ,load regex syntax
-- highlight will cause very slow
autocmd({ 'Filetype' }, {
	group = _G.nikola_group,
	pattern = '*.c,*.cpp,*.lua,*.go,*.rs,*.py,*.ts,*.tsx',
	callback = function()
		vim.api.nvim_command('syntax off')
	end,
})

-- disables autocommenting on new lines
autocmd({ 'FileType' }, {
	group = _G.nikola_group,
	pattern = '*',
	callback = function()
		vim.api.nvim_command('setlocal formatoptions-=cro')
	end,
})

-- go tmpl
autocmd({ 'BufWinEnter' }, {
	group = _G.nikola_group,
	pattern = '*.tmpl',
	callback = function()
		vim.api.nvim_command('set filetype=html')
	end,
})

-- vite enviroment
autocmd({ 'BufWinEnter' }, {
	group = _G.nikola_group,
	pattern = '.env.*',
	callback = function()
		vim.api.nvim_command('set filetype=sh')
	end,
})

-- highlight yank
autocmd('TextYankPost', {
	group = _G.nikola_group,
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
	group = _G.nikola_group,
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

-- save folds
autocmd('BufWinLeave', {
	pattern = '*.*',
	callback = function()
		vim.cmd.mkview()
	end,
})

-- load folds
autocmd('BufWinEnter', {
	group = _G.nikola_group,
	pattern = '*.*',
	callback = function()
		vim.cmd.loadview({ mods = { emsg_silent = true } })
	end,
})

-- q to quit these filetypes
autocmd({ 'FileType' }, {
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
	group = _G.nikola_group,
	pattern = { 'help' },
	callback = function()
		vim.cmd.wincmd('L')
	end,
})

-- fzf redraw
autocmd('VimResized', { pattern = '*', command = 'lua require("fzf-lua").redraw()' })
