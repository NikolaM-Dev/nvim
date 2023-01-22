-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, { command = 'checktime' })

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
	callback = function()
		vim.cmd('tabdo wincmd =')
	end,
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
	callback = function()
		local ok, cl = pcall(vim.api.nvim_win_get_var, 0, 'auto-cursorline')
		if ok and cl then
			vim.wo.cursorline = true
			vim.api.nvim_win_del_var(0, 'auto-cursorline')
		end
	end,
})
vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
	callback = function()
		local cl = vim.wo.cursorline
		if cl then
			vim.api.nvim_win_set_var(0, 'auto-cursorline', cl)
			vim.wo.cursorline = false
		end
	end,
})

-- create directories when needed, when saving a file
vim.api.nvim_create_autocmd('BufWritePre', {
	group = vim.api.nvim_create_augroup('auto_create_dir', { clear = true }),
	callback = function(event)
		local file = vim.loop.fs_realpath(event.match) or event.match

		vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
		local backup = vim.fn.fnamemodify(file, ':p:~:h')
		backup = backup:gsub('[/\\]', '%%')
		vim.go.backupext = backup
	end,
})

-- Fix conceallevel for json & help files
vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = { 'json', 'jsonc' },
	callback = function()
		vim.wo.spell = false
		vim.wo.conceallevel = 0
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPre', {
	pattern = '*',
	callback = function()
		vim.api.nvim_create_autocmd('FileType', {
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

-- Highlight on yank
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
	end,
})

-- q to quit these filetypes
vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = {
		'qf',
		'help',
		'man',
		'notify',
		'lspinfo',
		'spectre_panel',
		'startuptime',
		'tsplayground',
		'PlenaryTestPopup',
		'checkhealth',
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
	end,
})

-- -- Terminal options
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
	pattern = '',
	callback = function()
		vim.api.nvim_command('startinsert')
		vim.opt_local.listchars = {}
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.cursorline = false
		vim.opt_local.signcolumn = 'no'
	end,
})
-- turn on spelling
vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = { 'gitcommit', 'markdown' },
	callback = function()
		vim.opt_local.spell = true
	end,
})
