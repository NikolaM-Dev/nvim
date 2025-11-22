---@module 'lazy.types'
---@type LazySpec
return {
	'bullets-vim/bullets.vim',
	desc = 'Automated bullet lists',
	enabled = true,

	ft = { 'gitcommit', 'markdown', 'text' },

	init = function()
		vim.g.bullets_checkbox_markers = ' 369x' -- Change `X` to `x` to keep markdown format standard
		vim.g.bullets_outline_levels = { 'ROM', 'ABC', 'num', 'abc', 'rom', 'std-' } -- Remove * + as outline levels
	end,
}
