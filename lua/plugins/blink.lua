---@module 'lazy.types'
---@type LazySpec
return {
	'saghen/blink.cmp',
	desc = 'Performant, batteries-included completion plugin for Neovim',
	docs = 'https://cmp.saghen.dev',
	enabled = true,

	commit = '90d14caca4ae557665ab105080c27d5f289a2e30',
	build = 'cargo +nightly build --release',
	dependencies = { 'saghen/blink.compat' },

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		appearance = {
			nerd_font_variant = 'mono',
		},

		cmdline = {
			completion = {
				ghost_text = { enabled = true },
				list = { selection = { preselect = false } },
				menu = {
					auto_show = function()
						return vim.fn.getcmdtype() == ':'
					end,
				},
			},
			keymap = {
				preset = 'cmdline',

				[';'] = { 'select_accept_and_enter', 'fallback' },
				['<CR>'] = { 'accept_and_enter', 'fallback' },
				['<S-CR>'] = { 'select_accept_and_enter', 'fallback' },
			},
		},

		completion = {
			accept = {
				auto_brackets = {
					blocked_filetypes = { 'typescriptreact' },
				},
			},
			documentation = { auto_show = true },
			ghost_text = { enabled = true },
			list = { selection = { preselect = false } },
			trigger = {
				show_on_insert_on_trigger_character = false,
			},
			menu = {
				draw = {
					columns = { { 'kind_icon' }, { 'label', 'label_description', 'source_name', gap = 1 } },
				},
			},
		},

		fuzzy = {
			implementation = 'rust',
			prebuilt_binaries = { ignore_version_mismatch = true },
		},

		---@see https://cmp.saghen.dev/configuration/keymap.html
		keymap = {
			preset = 'enter',
			[';'] = { 'select_and_accept', 'fallback' },
			['<C-n>'] = { 'select_next', 'snippet_forward', 'fallback' },
			['<C-p>'] = { 'select_prev', 'snippet_backward', 'fallback' },
			['<C-l>'] = { 'snippet_forward', 'fallback' },
			['<C-h>'] = { 'snippet_backward', 'fallback' },
			['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
			['<C-e>'] = {
				function()
					local cmp = require('blink.cmp')
					if cmp.is_active() then
						return false -- Keep running the next commands
					end

					vim.snippet.stop()
				end,
				'hide',
				'fallback',
			},
			['<CR>'] = {
				function(cmp)
					if vim.bo.filetype == 'markdown' then
						return cmp.accept()
					end

					return cmp.select_and_accept()
				end,
				'fallback',
			},
		},

		signature = {
			enabled = false,
		},

		sources = {

			default = { 'snippets', 'lsp', 'path', 'buffer', 'natdat' },

			---@see https://cmp.saghen.dev/configuration/sources.html#providers
			providers = {
				natdat = {
					name = 'natdat',
					module = 'blink.compat.source',
				},

				path = {
					opts = {
						show_hidden_files_by_default = true,
					},
				},

				snippets = {
					score_offset = 4,
				},
			},
		},
	},

	opts_extend = { 'sources.default' },
}
