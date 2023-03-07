return {
	{
		'folke/tokyonight.nvim',
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			local tokyonight = require('tokyonight')

			tokyonight.setup({
				dim_inactive = true,
				styles = { functions = { bold = true } },
				sidebars = {
					'help',
					'outline',
					'qf',
					'spectre_panel',
					'startuptime',
					'terminal',
					'vista_kind',
				},
				on_highlights = function(hl, c)
					hl.TelescopeBorder = { fg = c.comment }
				end,
			})

			tokyonight.load()
		end,
	},
	{
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
					ts_rainbow = true,
				},
				styles = { functions = { 'bold' } },
			})

			catppuccin.load()
		end,
	},
}
