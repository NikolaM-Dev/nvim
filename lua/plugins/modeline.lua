---@module 'lazy'
---@type LazySpec
return {
	'nvimdev/modeline.nvim',
	desc = 'Neovim statusline plugin blazing fast than any statusline plugin',
	enabled = true,

	event = { 'BufReadPost */*', 'BufNewFile' },
	config = true,
}
