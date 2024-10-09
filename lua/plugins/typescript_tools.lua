---@type LazySpec
return {
	'pmizio/typescript-tools.nvim',
	enabled = true,

	cmd = { 'TSToolsAddMissingImports', 'TSToolsRemoveUnusedImports' },
	ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },

	config = function()
		'typescriptreact',
	},
			settings = {
				composite_mode = 'separate_diagnostic',
				publish_diagnostic_on = 'insert_leave',
				separate_diagnostic_server = true,
				-- tsserver_logs = "verbose",
				tsserver_file_preferences = {
					importModuleSpecifierPreference = 'relative',
				},
			},
		})
	end,
}
