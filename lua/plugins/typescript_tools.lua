---@type LazySpec
return {
	'pmizio/typescript-tools.nvim',
	enabled = true,

	cmd = { 'TSToolsAddMissingImports', 'TSToolsRemoveUnusedImports' },
	ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
		'javascriptreact',
		'typescript',
		'typescriptreact',
	},
}
