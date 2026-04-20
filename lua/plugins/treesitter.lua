---@module 'lazy.types'
---@type LazySpec
return {
	'nvim-treesitter/nvim-treesitter',
	desc = 'Nvim Treesitter configurations and abstraction layer',
	lazy = false,
	enabled = true,

	build = ':TSUpdate',

	---@class nkl.ts_opts
	---@field languages string[]
	opts = {
		languages = {},
	},

	---@param opts nkl.ts_opts
	config = function(_, opts)
		require('nvim-treesitter').install(opts.languages)

		vim.api.nvim_create_autocmd('FileType', {
			group = vim.api.nvim_create_augroup('treesitter.setup', {}),
			callback = function(args)
				local buf = args.buf
				local ft = args.match

				-- Skips if the buffer and/or the filetype is not installed
				local language = vim.treesitter.language.get_lang(ft) or ft
				if not vim.treesitter.language.add(language) then
					return
				end

				-- Folding
				vim.wo.foldmethod = 'expr'
				vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

				-- Highlight
				vim.treesitter.start(buf, language)

				-- Indentation
				vim.bo[buf].indentexpr = 'v:lua.require\'nvim-treesitter\'.indentexpr()'
			end,
		})
	end,
}
