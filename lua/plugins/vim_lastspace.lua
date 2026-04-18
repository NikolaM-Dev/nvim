---@module 'lazy.types'
---@type LazySpec
return {
	'farmergreg/vim-lastplace',
	desc = 'A vim / nvim plugin that intelligently reopens files at your last edit position.',
	enabled = true,

	init = function()
		vim.g.lastplace_ignore = 'gitcommit,gitrebase,hgcommit,svn,xxd'
		vim.g.lastplace_ignore_buftype = 'help,nofile,quickfix,terminal'
		vim.g.lastplace_open_folds = 0
	end,
}
