---@type LazySpec
return {
	'kdheepak/lazygit.nvim',
	enabled = false,

	cmd = {
		'LazyGit',
		'LazyGitConfig',
		'LazyGitCurrentFile',
		'LazyGitFilter',
		'LazyGitFilterCurrentFile',
	},

	keys = {
		{ '<leader>lg', n.map.cmd('LazyGit'), desc = 'Open [L]azy [G]it' },
	},
}
