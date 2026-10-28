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

				-- compile-mode.nvim (see :h compile-mode-highlights)
				hl['CompileModeError'] = { fg = c.error }
				hl['CompileModeWarning'] = { fg = c.warn }
				hl['CompileModeInfo'] = { fg = c.info }
				hl['CompileModeMessage'] = { underline = true }
				hl['CompileModeMessageRow'] = { fg = c.potassium }
				hl['CompileModeMessageCol'] = { fg = c.frost }
				hl['CompileModeCommandOutput'] = { fg = c.info }
				hl['CompileModeDirectoryMessage'] = { fg = c.info }
				hl['CompileModeOutputFile'] = { fg = c.potassium }
				hl['CompileModeCheckTarget'] = { fg = c.ember }
				hl['CompileModeCheckResult'] = { fg = c.ember, bold = true }
				hl['CompileModeErrorLocus'] = { link = 'Visual' }
			end,
		})

		vim.cmd.colorscheme('cendre')
	end,
}
