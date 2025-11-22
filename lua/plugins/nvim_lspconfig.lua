---@module 'lazy.types'
---@type LazySpec
return {
	'neovim/nvim-lspconfig',
	desc = 'Quickstart configs for Nvim LSP',
	docs = 'https://github.com/neovim/nvim-lspconfig/blob/master/doc',
	enabled = true,

	events = { 'BufNewFile', 'BufReadPost', 'BufWritePre' },

	opts = {
		servers = {},
	},

	config = function(_, opts)
		local map = require('lib').map

		---@param next? boolean
		---@param severity? string|integer
		local function go_to_diagnostic(next, severity)
			severity = severity and vim.diagnostic.severity[severity] or nil

			return function()
				if next then
					vim.diagnostic.jump({ count = 1, float = true, severity })
				else
					vim.diagnostic.jump({ count = -1, float = true, severity })
				end

				vim.cmd('normal! zz')
			end
		end

		-- stylua: ignore start
		map('n', 'K',    vim.lsp.buf.hover,                  { desc = 'Hover Documentation'      })
		map('n', 'gd',   Snacks.picker.lsp_definitions,      { desc = '[G]oto [D]efinition'      })
		map('n', 'grN',  Snacks.rename.rename_file,          { desc = '[R]e[N]ame File'          })
		map('n', 'grd',  Snacks.picker.lsp_declarations,     { desc = 'Review [D]eclarations'    })
		map('n', 'gri',  Snacks.picker.lsp_implementations,  { desc = 'Review [I]mplementations' })
		map('n', 'grr',  Snacks.picker.lsp_references,       { desc = 'Review [R]eferences'      })
		map('n', 'grt',  Snacks.picker.lsp_type_definitions, { desc = 'Goto T[y]pe Definition'   })

		map('n', '[d', go_to_diagnostic(false), { desc = 'Prev [D]iagnostic' })
		map('n', ']d', go_to_diagnostic(true),  { desc = 'Next [D]iagnostic' })
		-- stylua: ignore end

		-- [LSP Configs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
		for server, config in pairs(opts.servers) do
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end

		vim.diagnostic.config({
			float = {
				header = { '🔥 Diagnostics\n', 'Title' },
			},
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = '', --' ',
					[vim.diagnostic.severity.HINT] = '', --' ',  ○
					[vim.diagnostic.severity.INFO] = '●', --' ',
					[vim.diagnostic.severity.WARN] = '▲', --' ',
				},
			},
			virtual_text = {
				prefix = '🔥',
				spacing = 2,
			},
		})
	end,
}
