---@type LazySpec
return {
	'catppuccin/nvim',
	enabled = true,

	lazy = false,
	priority = 1000,
	config = function()
		local catppuccin = require('catppuccin')

		catppuccin.setup({
			transparent_background = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				harpoon = true,
				hop = true,
				illuminate = true,
				lsp_trouble = true,
				mason = true,
				mini = true,
				notify = true,
				treesitter_context = false,
			},
			styles = { functions = { 'bold' } },
			custom_highlights = function(colors)
				return {
					MiniIndentscopeSymbol = { bg = '', fg = colors.surface1 },
					PmenuSel = { bg = colors.surface0, fg = '' },

					-- MeanderingProgrammer/render-markdown.nvim
					RenderMarkdownCode = { bg = colors.crust },
					RenderMarkdownCodeInline = { fg = colors.sky },
					RenderMarkdownDash = { fg = colors.blue },
					RenderMarkdownH1Bg = { fg = colors.red },
					RenderMarkdownH1 = { fg = colors.red },
					RenderMarkdownH2Bg = { fg = colors.peach },
					RenderMarkdownH2 = { fg = colors.peach },
					RenderMarkdownH3Bg = { fg = colors.green },
					RenderMarkdownH3 = { fg = colors.green },
					RenderMarkdownH4Bg = { fg = colors.teal },
					RenderMarkdownH4 = { fg = colors.teal },
					RenderMarkdownH5Bg = { fg = colors.lavender },
					RenderMarkdownH5 = { fg = colors.lavender },
					RenderMarkdownH6Bg = { fg = colors.mauve },
					RenderMarkdownH6 = { fg = colors.mauve },

					['@keyword.directive.markdown'] = { fg = colors.sky },
					['@punctuation.delimiter.yaml'] = { fg = colors.sky },

					['@lsp.type.enumMember.markdown'] = { fg = colors.sky },
					['@markdown_list_marker'] = { bold = true, fg = colors.sky },
					['@markup.list.markdown'] = { fg = colors.lavender },
					['@markup.quote.markdown'] = { bold = false, fg = colors.maroon },

					['@markup.heading.1.markdown'] = { fg = colors.red },
					['@markup.heading.2.markdown'] = { fg = colors.peach },
					['@markup.heading.3.markdown'] = { fg = colors.green },
					['@markup.heading.4.markdown'] = { fg = colors.teal },
					['@markup.heading.5.markdown'] = { fg = colors.lavender },
					['@markup.heading.6.markdown'] = { fg = colors.mauve },
					['@markup.italic'] = { fg = colors.green, italic = true },
					['@markup.link.label.markdown_inline'] = { bold = true, fg = colors.mauve, underline = true },
					['@markup.strong'] = { bold = true, fg = colors.mauve },
					['@markup.raw.block.markdown'] = { bg = colors.crust },
				}
			end,
		})
	end,
}
