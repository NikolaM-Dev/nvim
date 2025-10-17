local map = require('lib').map

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
		colorscheme = { 'gruvbox-material', 'rose-pine', 'tokyonight', 'habamax' },
	},
	rocks = {
		hererocks = false,
	},
	ui = {
		backdrop = 0,
		border = vim.o.winborder,
		pills = true, ---@type boolean Show pills on top of the Lazy window
		size = { width = 0.9, height = 0.9 },
		title = ' 💤  Lazy Plugin Manager ', ---@type string only works when border is not "none"
		title_pos = 'center', ---@type "center" | "left" | "right"
		wrap = true, -- wrap the lines in the UI

		icons = {
			cmd = '󰆍',
			config = '',
			debug = '  ',
			event = '',
			ft = '󰈙',
			import = '󰈠',
			init = '',
			keys = '󰌌',
			lazy = '󰋣 ',
			list = { '', '', '', '' },
			loaded = '󰄳',
			not_loaded = '󰚌',
			plugin = '󰏖',
			runtime = '',
			source = '',
			start = '',
			task = '󰘽 ',
		},
	},
})

map('n', '<leader>lz', '<cmd>Lazy<cr>', { desc = 'Open [L]a[Z]y' })
map('n', '<leader>lp', '<cmd>Lazy profile<cr>', { desc = 'Open [L]azy [P]rofile' })
