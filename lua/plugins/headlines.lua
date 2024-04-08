return {
	'lukas-reineke/headlines.nvim',
	ft = 'markdown',
	dependencies = { 'catppuccin/nvim', 'nvim-treesitter/nvim-treesitter' },
	config = function()
		local PALETTE = require('catppuccin.palettes').get_palette('mocha')

		local headline_fg = '#2B2B2B'
		local marker_fg = PALETTE.surface2

		vim.api.nvim_set_hl(0, 'Headline1', { bg = PALETTE.red, fg = headline_fg })
		vim.api.nvim_set_hl(0, 'Headline2', { bg = PALETTE.peach, fg = headline_fg })
		vim.api.nvim_set_hl(0, 'Headline3', { bg = PALETTE.green, fg = headline_fg })
		vim.api.nvim_set_hl(0, 'Headline4', { bg = PALETTE.teal, fg = headline_fg })
		vim.api.nvim_set_hl(0, 'Headline5', { bg = PALETTE.lavender, fg = headline_fg })
		vim.api.nvim_set_hl(0, 'Headline6', { bg = PALETTE.mauve, fg = headline_fg })

		vim.api.nvim_set_hl(0, 'CodeBlock', { bg = PALETTE.crust })

		vim.api.nvim_set_hl(0, 'Dash', { fg = PALETTE.blue })
		vim.api.nvim_set_hl(0, '@markup.italic', { bg = PALETTE.green })
		vim.api.nvim_set_hl(0, '@markup.strong', { bg = PALETTE.red })
		vim.api.nvim_set_hl(0, 'Quote', { bg = PALETTE.overlay2 })

		vim.api.nvim_set_hl(0, '@text.title.1.marker.markdown', { fg = marker_fg })
		vim.api.nvim_set_hl(0, '@text.title.2.marker.markdown', { fg = marker_fg })
		vim.api.nvim_set_hl(0, '@text.title.3.marker.markdown', { fg = marker_fg })
		vim.api.nvim_set_hl(0, '@text.title.4.marker.markdown', { fg = marker_fg })
		vim.api.nvim_set_hl(0, '@text.title.5.marker.markdown', { fg = marker_fg })
		vim.api.nvim_set_hl(0, '@text.title.6.marker.markdown', { fg = marker_fg })
				quote_highlight = 'Quote',
				quote_string = '',
			},
		})
	end,
}
