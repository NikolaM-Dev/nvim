---@type LazySpec
return {
	'rose-pine/neovim',
	enabled = true,

	lazy = false,
	priority = 1000,
	name = 'rose-pine',
	config = function()
		require('rose-pine').setup({
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		})

		vim.cmd.colorscheme('rose-pine-moon')
	end,
}
