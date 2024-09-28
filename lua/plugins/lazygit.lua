---@type LazySpec
return {
	'kdheepak/lazygit.nvim',
	enabled = false,

	cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitCurrentFile', 'LazyGitFilter', 'LazyGitFilterCurrentFile' },
	dependencies = 'nvim-lua/plenary.nvim',
	keys = {
		{ '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open [L]azy [G]it' },
	},
}
