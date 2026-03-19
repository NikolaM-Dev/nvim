vim.env.LAZY_STDPATH = '.repro'

vim.g.mapleader = ' '
vim.o.number = true
vim.o.relativenumber = true

load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()

require('lazy.minit').repro({
	spec = {
		{
			-- Place your plugins here
		},
	},
})
