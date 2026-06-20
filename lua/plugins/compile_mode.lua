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
				dts = 'just build',
				typescript = 'vp run typecheck',
				typescriptreact = 'vp run build',
				-- c = "cc -o %:r % && ./%:r",
				-- cpp = "cc -std=c++23 -o %:r % && ./%:r",
				-- java = "javac % && java %:r",
				-- go = "go run %",
			},

			-- to make `:Compile` replace special characters (e.g. `%`) in
			-- the command (and behave more like `:!`), add:
			bang_expansion = true,

			directory_change_matchers = {
				{ regex = [[^> @\?[^@]\+@\S\+ \S\+ \zs\(\S\+\)\ze$]], filename = 1 },
			},
			error_regexp_table = {
				custom = {
					regex = '^\\%(\\[\\%(ERROR\\|\\(WARNING\\)\\|\\(INFO\\)\\)\\] \\)\\?\\([^\n :]\\+\\):\\([1-9][0-9]*\\): ',
					filename = 3,
					row = 4,
					type = { 1, 2 },
					priority = 2,
				},
				nodejs = {
					regex = '^\\s\\+at .\\+ (\\(.\\+\\):\\([1-9][0-9]*\\):\\([1-9][0-9]*\\))$',
					filename = 1,
					row = 2,
					col = 3,
					priority = 2,
				},
				tsc1 = {
					regex = [[^\(.\+\)(\([1-9][0-9]*\)[,:]\([1-9][0-9]*\)): error TS[1-9][0-9]*:]],
					filename = 1,
					row = 2,
					col = 3,
				},
				tsc2 = {
					regex = [[^\(.\+\):\([1-9][0-9]*\):\([1-9][0-9]*\)\s\+-\s\+error\s\+TS[1-9][0-9]*:]],
					filename = 1,
					row = 2,
					col = 3,
				},
			},
		}
	end,
}
