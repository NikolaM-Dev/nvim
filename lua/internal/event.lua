local autocmd = vim.api.nvim_create_autocmd
local autogrup = vim.api.nvim_create_augroup
local nikola_group = autogrup('NikolaGroup', { clear = true })

-- trim white spaces
autocmd({ 'BufWritePre' }, {
	group = nikola_group,
	pattern = '*',
	command = '%s/\\s\\+$//e',
})

-- TODO: Refactor
-- mormat on save in lua
autocmd({ 'FileType' }, {
	group = nikola_group,
	pattern = 'lua',
	callback = function()
		local buff = tonumber(vim.fn.expand('<abuf>'), 10)
		vim.keymap.set('n', '<C-s>', ':w<CR> :silent !stylua .<CR>', { noremap = true, buffer = buff })
	end,
})

-- disable default syntax in these file.
-- when file is larged ,load regex syntax
-- highlight will cause very slow
autocmd({ 'Filetype' }, {
	group = nikola_group,
	pattern = '*.c,*.cpp,*.lua,*.go,*.rs,*.py,*.ts,*.tsx',
	callback = function()
		vim.cmd('syntax off')
	end,
})
