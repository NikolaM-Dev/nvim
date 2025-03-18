---@type LazySpec
return {
	'LazyVim/LazyVim',
	enabled = true,

	---@type LazyVimConfig
	---@diagnostic disable-next-line: missing-fields
	opts = {
		colorscheme = 'rose-pine-moon',
		defaults = {
			autocmds = false,
			keymaps = false,
		},
	},
}
