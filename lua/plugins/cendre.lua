---@module 'lazy.types'
---@type LazySpec
return {
	'Aejkatappaja/cendre',
	desc = 'A dark colorscheme for Neovim. One wood fire, taken apart: five pigments, none of them chosen.',
	enabled = true,

	lazy = false,
	priority = 1000,

	config = function()
		require('cendre').setup({
			on_highlights = function(hl, c)
				-- Markdown
				hl['@markup.italic'] = { fg = c.info, italic = true }
				hl['@markup.strong'] = { fg = c.warn, bold = true }

				-- Plugins
				hl['fFHintChar'] = { link = 'Type' }
				hl['fFHintNumber'] = { link = 'EyelinerSecondary' }
			end,
		})

		vim.cmd.colorscheme('cendre')
	end,
}
