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
					PmenuSel = { bg = colors.surface0, fg = '' },
				}
			end,
		})

		catppuccin.load()
	end,
}
