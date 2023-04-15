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
		})

		catppuccin.load()

		vim.cmd('highlight PmenuSel guifg=NONE')
	end,
}
