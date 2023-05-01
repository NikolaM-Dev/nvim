local M = {
	'folke/tokyonight.nvim',
	lazy = false,
	priority = 1000,
}

function M.config()
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
end

return M
