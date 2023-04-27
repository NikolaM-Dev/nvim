return {
	'catppuccin/nvim',
	event = 'VimEnter',
	lazy = false,
	priority = 1000,
	config = function()
		local catppuccin = require('catppuccin')

		catppuccin.setup({
			integrations = {
				harpoon = true,
				hop = true,
				illuminate = true,
				lsp_trouble = true,
				mason = true,
				mini = true,
				notify = true,
				ts_rainbow = true,
			},
			styles = { functions = { 'bold' } },
			custom_highlights = function(colors)
				return {
					PmenuSel = { bg = colors.surface0, fg = '' },

					-- TODO: IDK 󱞤
					-- CursorLineNr = { fg = colors.mauve },
					-- GitSignsChange = { fg = colors.peach },
					-- IndentBlanklineChar = { fg = colors.surface0 },
					-- IndentBlanklineContextChar = { fg = colors.surface2 },
					-- NormalFloat = { bg = colors.crust },
					-- NvimTreeExecFile = { fg = colors.text },
					-- VertSplit = { bg = colors.base, fg = colors.surface0 },
				}
			end,
		})

		catppuccin.load()
	end,
}
