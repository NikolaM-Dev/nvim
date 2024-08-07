---@type LazySpec
return {
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
}
