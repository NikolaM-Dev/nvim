local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
	change_detection = { enabled = false, notify = false },
	checker = { enabled = true, notify = false },
	defaults = { lazy = true },
	install = { colorscheme = { 'tokyonight' } },
	performance = {
		cache = { enabled = false },
		rtp = {
			disabled_plugins = {
				'2html_plugin',
				'getscript',
				'getscriptPlugin',
				'gzip',
				'logipat',
				'matchit',
				'matchparen',
				'netrw',
				'netrwFileHandlers',
				'netrwPlugin',
				'netrwSettings',
				'rplugin',
				'rrhelper',
				'tar',
				'tarPlugin',
				'tohtml',
				'tutor',
				'vimball',
				'vimballPlugin',
				'zip',
				'zipPlugin',
			},
		},
		ui = {
			border = 'rounded',
			browser = 'chrome',
			throttle = 40,
			icons = {
				cmd = ' ',
				config = '',
				event = '',
				ft = ' ',
				init = ' ',
				import = ' ',
				keys = ' ',
				lazy = '鈴 ',
				loaded = '●',
				not_loaded = '○',
				plugin = ' ',
				runtime = ' ',
				source = ' ',
				start = '',
				task = '✔ ',
				list = {
					'●',
					'➜',
					'★',
					'‒',
				},
			},
		},
	},
})