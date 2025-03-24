local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
			{ out, 'WarningMsg' },
			{ '\nPress any key to exit...' },
		}, true, {})

		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	spec = {
		{ import = 'plugins' },
		{ import = 'plugins.telescope' },
	},
	change_detection = { enabled = true, notify = false },
	checker = { enabled = true, notify = false },
	defaults = { lazy = true, version = false },
	diff = { cmd = 'terminal_git' },
	install = { colorscheme = { 'rose-pine', 'catppuccin', 'tokyonight', 'habamax' } },
	---@diagnostic disable-next-line: assign-type-mismatch
	dev = {
		fallback = true,
		path = '~/workspace/open-source/nvim',
		patterns = { 'NikolaM-Dev' },
	},
	performance = {
		cache = { enabled = true },
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
	},
	ui = {
		border = 'single',
		browser = 'chrome',
		throttle = 42,
		icons = {
			cmd = '󰆍',
			config = '',
			event = '',
			ft = '󰈙',
			init = '',
			import = '󰈠',
			keys = '󰌌',
			lazy = '󰋣 ',
			loaded = '󰄳',
			not_loaded = '󰚌',
			plugin = '󰏖',
			runtime = '',
			source = '',
			start = '',
			task = '󰘽 ',
			list = {
				'',
				'',
				'',
				'',
			},
		},
	},
})
