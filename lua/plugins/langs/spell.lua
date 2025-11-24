---@module 'lazy.types'
---@type LazySpec
return {
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'harper-ls' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.harper_ls = {
				settings = {
					['harper-ls'] = {
						markdown = {
							IgnoreLinkTitle = true,
						},
						linters = {
							-- disable buggy rules
							-- CommaFixes = false, -- https://github.com/Automattic/harper/issues/1097
							SentenceCapitalization = false, -- https://github.com/Automattic/harper/issues/1056
							UnclosedQuotes = false, -- https://github.com/Automattic/harper/issues/1573

							-- enable extra rules?
							BoringWords = false,
							LinkingVerbs = false,
							SpelledNumbers = false,
							UseGenitive = true,
						},
						dialect = 'American',
						isolateEnglish = true,
					},
				},
			}

			nkl.key.map('n', 'zg', function()
				vim.lsp.buf.code_action({
					apply = true,
					filter = function(a)
						return a.title:find('^Add .* to the user dictionary%.') ~= nil
					end,
				})
			end, { desc = '  Add word to harper dictionary' })
		end,
	},
}
