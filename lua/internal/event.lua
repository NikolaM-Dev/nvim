local status_ok, _ = pcall(require, 'tokyonight')
if not status_ok then
	return
end

local autocmd = vim.api.nvim_create_autocmd
local autogrup = vim.api.nvim_create_augroup
_G.nikola_group = autogrup('NikolaGroup', { clear = true })

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

-- vite qa enviroment
autocmd({ 'BufWinEnter' }, {
	group = _G.nikola_group,
	pattern = '.env.testing',
	callback = function()
		vim.api.nvim_command('set filetype=sh')
	end,
})

-- vite production enviroment
autocmd({ 'BufWinEnter' }, {
	group = _G.nikola_group,
	pattern = '.env.production',
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
			timeout = 40,
		})
	end,
})

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
