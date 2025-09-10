---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'neovim/nvim-lspconfig',
	desc = 'Quickstart configs for Nvim LSP',
	docs = 'https://github.com/neovim/nvim-lspconfig/blob/master/doc',
	enabled = true,

	event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },

	opts = {
		servers = {},
	},

	config = function(_, opts)
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
			desc = 'LSP actions',
			callback = function(args)
				if #args then
					return
				end

				---@param lhs string
				---@param rhs function
				---@param desc string
				---@param mode? string|string[]
				local function map(lhs, rhs, desc, mode)
					vim.keymap.set(mode or 'n', lhs, rhs, { buffer = args.buf, desc = desc })
				end

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
				map('[d', go_to_diagnostic(false), 'Prev [D]iagnostic')
				map(']d', go_to_diagnostic(true),  'Next [D]iagnostic')
				-- stylua: ignore end
			end,
		})

		-- [LSP Configs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
		local lspconfig = require('lspconfig')
		for server, config in pairs(opts.servers) do
			if server then
				lspconfig[server].setup(config)
			end
		end

		vim.diagnostic.config({
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
