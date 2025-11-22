---@module 'lazy.types'
---@type LazySpec
return {
	'sainnhe/gruvbox-material',
	desc = 'Gruvbox with Material Palette',
	enabled = true,

	lazy = false,
	priority = 1000,

	init = function()
		vim.g.gruvbox_material_better_performance = 1
		vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
		vim.g.gruvbox_material_enable_bold = 1
		vim.g.gruvbox_material_enable_italic = 1
		vim.g.gruvbox_material_float_style = 'blend'
		vim.g.gruvbox_material_transparent_background = 2
	end,

	config = function()
		vim.cmd.colorscheme('gruvbox-material')

		vim.api.nvim_set_hl(0, '@lsp.type.comment.lua', { fg = 'none' })
		vim.api.nvim_set_hl(0, 'PMenu', { bg = 'none' })
		vim.api.nvim_set_hl(0, 'PMenuSel', { bg = '#45403d', fg = 'none' })
		vim.api.nvim_set_hl(0, 'inactiveBorderColor', { fg = '#7c6f64' })
	end,
}
