---@type LazySpec
return {
	'stevearc/conform.nvim',
	enabled = true,

	cmd = { 'ConformInfo' },
	event = 'BufWritePre',

	init = function()
		vim.o.formatexpr = 'v:lua.require\'conform\'.formatexpr()'
	end,

	---@return conform.setupOpts
	opts = function()
		local prettier = { 'prettierd', 'prettier', stop_after_first = true }

		return {
			log_level = vim.log.levels.TRACE,
			notify_on_error = true,
			formatters_by_ft = {
				css = prettier,
				go = { 'gofumpt', 'goimports' },
				graphql = prettier,
				html = prettier,
				javascript = prettier,
				javascriptreact = prettier,
				json5 = prettier,
				jsonc = prettier,
				json = prettier,
				lua = { 'stylua' },
				markdown = prettier,
				svelte = prettier,
				typescript = prettier,
				typescriptreact = prettier,
				yaml = prettier,
			},

			format_on_save = function()
				return {
					timeout_ms = 5000,
					lsp_format = 'fallback',
				}
			end,
		}
	end,

	---@param opts conform.setupOpts
	config = function(_, opts)
		require('conform').setup(opts)
	end,
}
