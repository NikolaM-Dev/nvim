---@type LazySpec
return {
	'rose-pine/neovim',
	enabled = true,

	lazy = false,
	priority = 1000,
	name = 'rose-pine',
	config = function()
		require('rose-pine').setup({
			highlight_groups = {
				TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
				TelescopeNormal = { bg = 'none' },
				TelescopePromptNormal = { bg = 'none' },
				TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
				TelescopeSelectionCaret = { fg = 'rose', bg = 'rose' },
				TelescopeSelection = { fg = 'text', bg = 'none' },
			},

			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		})

		vim.cmd.colorscheme('rose-pine-moon')
	end,
}
