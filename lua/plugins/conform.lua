---@module 'lazy.types'
---@type LazySpec
return {
	'stevearc/conform.nvim',
	desc = 'Lightweight yet powerful formatter plugin for Neovim',
	enabled = true,

	cmd = { 'ConformInfo' },
	event = 'BufWritePre',

	---@type conform.setupOpts
	opts = {
		default_format_opts = { lsp_format = 'fallback' },
		format_after_save = function(bufnr)
			if vim.b[bufnr].disable_autoformat then
				return
			end

			return { timeout_ms = 5000 }
		end,
		formatters = {},
		formatters_by_ft = {},
		log_level = vim.log.levels.TRACE,
		notify_on_error = true,
	},

	---@param opts conform.setupOpts
	config = function(_, opts)
		require('conform').setup(opts)
	end,

	init = function()
		vim.o.formatexpr = 'v:lua.require\'conform\'.formatexpr()'
	end,
}
