---@module 'lazy'
---@type LazySpec
return {
	'NikolaM-Dev/modeline.nvim',
	desc = 'Neovim statusline plugin blazing fast than any statusline plugin',
	enabled = true,

	event = { 'BufReadPost */*', 'BufNewFile' },
	config = true,
}
