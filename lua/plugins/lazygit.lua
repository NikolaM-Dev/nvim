---@type LazySpec
return {
	'kdheepak/lazygit.nvim',
	enabled = true,

	cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitCurrentFile', 'LazyGitFilter', 'LazyGitFilterCurrentFile' },
	dependencies = 'nvim-lua/plenary.nvim',
	keys = {
		{ '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open [L]azy [G]it' },
	},
}
