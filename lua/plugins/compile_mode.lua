---@module 'lazy.types'
---@type LazySpec
return {
	'ej-shafran/compile-mode.nvim',
	desc = 'A plugin for Neovim inspired by Emacs\' Compilation Mode',
	enabled = true,

	keys = {
		{ '<leader>cpm', '<cmd>Compile<cr>', desc = ' Compile Mode' },
	},

	init = function()
		---@module 'compile-mode'
		---@type CompileModeOpts
		vim.g.compile_mode = {
			-- if you use something like `nvim-cmp` or `blink.cmp` for completion,
			-- set this to fix tab completion in command mode:
			-- input_word_completion = true,

			-- to add ANSI escape code support, add:
			baleia_setup = false,

			default_command = {
				-- python = "python %",
				-- lua = "lua %",
				-- javascript = "bun %",
				typescript = 'bun run typecheck',
				typescriptreact = 'bun run build',
				-- c = "cc -o %:r % && ./%:r",
				-- cpp = "cc -std=c++23 -o %:r % && ./%:r",
				-- java = "javac % && java %:r",
				-- go = "go run %",
			},

			-- to make `:Compile` replace special characters (e.g. `%`) in
			-- the command (and behave more like `:!`), add:
			bang_expansion = true,
			error_regexp_table = {
				typescript = {
					regex = '^\\(.\\+\\)(\\([1-9][0-9]*\\)[,:]\\([1-9][0-9]*\\)): error TS[1-9][0-9]*:',
					filename = 1,
					row = 2,
					col = 3,
				},
			},
		}
	end,
}
