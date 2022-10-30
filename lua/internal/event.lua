local autocmd = vim.api.nvim_create_autocmd
local autogrup = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_command
_G.nikola_group = autogrup('NikolaGroup', { clear = true })

-- disable default syntax in these file.
-- when file is larged ,load regex syntax
-- highlight will cause very slow
autocmd({ 'Filetype' }, {
	group = _G.nikola_group,
	pattern = '*.c,*.cpp,*.lua,*.go,*.rs,*.py,*.ts,*.tsx',
	callback = function()
		cmd('syntax off')
	end,
})

-- disables autocommenting on new lines
autocmd({ 'FileType' }, {
	group = _G.nikola_group,
	pattern = '*',
	callback = function()
		cmd('setlocal formatoptions-=cro')
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
