---@module 'lazy.types'
---@type LazySpec
return {
	'pmizio/typescript-tools.nvim',
	lazy = false,
	desc = '⚡ TypeScript integration NeoVim deserves ⚡',

	cmd = { 'TSToolsAddMissingImports', 'TSToolsRemoveUnusedImports' },

	keys = {
		{ '<leader>ru', '<cmd>TSToolsRemoveUnusedImports<cr>', desc = '󱐋 Remove Unused Imports' },
		{ '<leader>am', '<cmd>TSToolsAddMissingImports<cr>', desc = '󱐋 Add Missing Imports' },
	},

	config = true,
}
