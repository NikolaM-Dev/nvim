---@type LazySpec
return {
	'pmizio/typescript-tools.nvim',
	enabled = true,

	cmd = { 'TSToolsAddMissingImports', 'TSToolsRemoveUnusedImports' },
	ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },

	config = function()
		require('typescript-tools').setup({
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
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
