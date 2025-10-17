---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'sainnhe/gruvbox-material',
	desc = 'Gruvbox with Material Palette',
	enabled = true,

	lazy = false,
	priority = 1000,


	config = function()
		vim.cmd.colorscheme('gruvbox-material')
	end,
}
