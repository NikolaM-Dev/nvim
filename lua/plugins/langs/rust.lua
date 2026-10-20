---@module 'lazy.types'
---@type LazySpec
return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'rust', 'ron' })
		end,
	},

	-- rustaceanvim registers and configures `rust-analyzer` itself, so there is
	-- intentionally no `rust_analyzer` entry in `nvim-lspconfig` (that would
	-- conflict). We use the `rust-analyzer` binary from rustup (Arch: `rustup`)
	-- so the LSP always matches the project's `rustc`.
	-- `rustup component add rust-analyzer` (already done).
	{
		'mrcjkb/rustaceanvim',
		desc = 'Rust: rust-analyzer integration, runnables, debuggables, tests',
		docs = 'https://github.com/mrcjkb/rustaceanvim',
		version = '^9',
		-- Implements proper lazy-loading through a filetype plugin.
		lazy = false,

		init = function()
			---@type rustaceanvim.Opts
			vim.g.rustaceanvim = {
				server = {
					-- `default_settings` (not `settings`) so project-local
					-- rust-analyzer config can still override these.
					default_settings = {
						['rust-analyzer'] = {
							cargo = { allFeatures = true },
							check = { command = 'clippy' },
							procMacro = { enable = true },
						},
					},
				},
				tools = {
					-- `:RustLsp codeAction` supports rust-analyzer's grouping.
					-- Fall back to `vim.ui.select` (fzf-lua) for ungrouped actions.
					code_actions = { ui_select_fallback = true },
				},
			}
		end,
	},

	-- Use rustaceanvim's adapter instead of neotest-rust: discovery and command
	-- construction come from rust-analyzer, so they match `:RustLsp` behavior.
	{
		'nvim-neotest/neotest',
		opts = function(_, opts)
			table.insert(opts.adapters, require('rustaceanvim.neotest'))
		end,
	},

	{
		'stevearc/conform.nvim',
		opts = function(_, opts)
			-- rustfmt comes from rustup, no mason package needed.
			-- Falls back to rust-analyzer's formatting if binary not in PATH.
			opts.formatters_by_ft.rust = { 'rustfmt' }
		end,
	},
}
