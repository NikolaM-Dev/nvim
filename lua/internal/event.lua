local autocmd = vim.api.nvim_create_autocmd
local autogrup = vim.api.nvim_create_augroup
_G.nikola_group = autogrup('NikolaGroup', { clear = true })

-- trim white spaces
autocmd({ 'BufWritePre' }, {
	group = nikola_group,
	pattern = '*',
	command = '%s/\vs+$|\n+%$//e',
})

-- disable default syntax in these file.
-- when file is larged ,load regex syntax
-- highlight will cause very slow
autocmd({ 'Filetype' }, {
	group = _G.nikola_group,
	pattern = '*.c,*.cpp,*.lua,*.go,*.rs,*.py,*.ts,*.tsx',
	callback = function()
		vim.cmd('syntax off')
	end,
})

-- disables autocommenting on new lines
autocmd({ 'FileType' }, {
	group = _G.nikola_group,
	pattern = '*',
	callback = function()
		vim.cmd('setlocal formatoptions-=cro')
	end,
})
