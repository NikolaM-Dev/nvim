---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'stevearc/conform.nvim',
	desc = 'Lightweight yet powerful formatter plugin for Neovim',
	enabled = true,

	cmd = { 'ConformInfo' },
	event = 'BufWritePre',

	---@type conform.setupOpts
	opts = {
		log_level = vim.log.levels.TRACE,
		notify_on_error = true,
		formatters_by_ft = {},

		format_on_save = function()
			return {
				timeout_ms = 1500,
				lsp_format = 'never',
			}
		end,
	},

	---@param opts conform.setupOpts
	config = function(_, opts)
		require('conform').setup(opts)
	end,

	-- init = function()
	-- 	vim.o.formatexpr = 'v:lua.require\'conform\'.formatexpr()'
	-- end,
}
