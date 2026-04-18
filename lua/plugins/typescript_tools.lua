---@module 'lazy.types'
---@type LazySpec
return {
	'pmizio/typescript-tools.nvim',
	desc = '⚡ TypeScript integration NeoVim deserves ⚡',
	enabled = true,

	ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
	cmd = { 'TSToolsAddMissingImports', 'TSToolsRemoveUnusedImports' },

	keys = {
		{ '<leader>ru', '<cmd>TSToolsRemoveUnusedImports<cr>', desc = '󱐋 Remove Unused Imports' },
		{ '<leader>am', '<cmd>TSToolsAddMissingImports<cr>', desc = '󱐋 Add Missing Imports' },
	},

	config = true,
}
