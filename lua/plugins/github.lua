---@module 'lazy.types'
---@type LazySpec
return {
	'projekt0n/github-nvim-theme',
	desc = 'GitHub\'s Neovim themes',
	name = 'github-theme',

	lazy = false,
	priority = 1000,

	config = function()
		require('github-theme').setup({
			options = {
				styles = {
					comments = 'italic',
				},
			},
		})

		vim.cmd.colorscheme('github_dark_dimmed')
	end,
}
