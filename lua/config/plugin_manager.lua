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
	desc = 'A modern plugin manager for Neovim',
	docs = 'https://lazy.folke.io',
	spec = {
		{ import = 'plugins' },
		{ import = 'plugins.langs' },
	},
	default = {
		lazy = true,
	},
	change_detection = {
		notify = false,
	},
	install = {
		colorscheme = { 'tokyonight', 'habamax' },
	},
})
