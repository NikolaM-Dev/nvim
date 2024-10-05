local Map = require('lib.map')

---@type LazySpec
return {
	'kdheepak/lazygit.nvim',
	enabled = false,

	cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitCurrentFile', 'LazyGitFilter', 'LazyGitFilterCurrentFile' },
	dependencies = 'nvim-lua/plenary.nvim',
	keys = {
		{ '<leader>lg', Map:cmd('LazyGit'), desc = 'Open [L]azy [G]it' },
	},
}
