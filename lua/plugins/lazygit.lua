---@type LazySpec
return {
	'kdheepak/lazygit.nvim',
	enabled = true,
	dependencies = 'nvim-lua/plenary.nvim',
	keys = {
		{ '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open [L]azy [G]it' },
	},
}
