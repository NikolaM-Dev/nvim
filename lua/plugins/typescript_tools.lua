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

	config = function()
		require('typescript-tools').setup({
			settings = {
				tsserver_file_preferences = {
					-- importModuleSpecifierPreference = vim.uv.fs_stat(vim.fn.getcwd() .. '/next.config.ts')
					-- 		-- `non-relative`: Prefers a non-relative import based on the baseUrl (aliases) or paths configured in your jsconfig.json/tsconfig.json.
					-- 		and 'non-relative'
					-- 	-- `relative`: Prefers a relative path to the imported file location.
					-- 	or 'relative',

					importModuleSpecifierPreference = 'non-relative',
				},
			},
		})
	end,
}
