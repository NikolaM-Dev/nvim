---@module 'lazy.types'
---@type LazySpec
return {
	'shortcuts/no-neck-pain.nvim',
	desc = '☕ Dead simple yet super extensible zen mode plugin to protect your neck.',
	enabled = true,

	cmd = 'NoNeckPain',

	keys = {
		{ '<C-S-z>', '<cmd>NoNeckPain<cr>', desc = 'Toggle [Z]en [M]ode' },
		{ '<leader>zm', '<cmd>NoNeckPain<cr>', desc = 'Toggle [Z]en [M]ode' },
	},

	---@module 'no-neck-pain.config'
	opts = {
		width = 100,
		autocmds = {
			enableOnTabEnter = true,
			reloadOnColorSchemeChange = true,
			skipEnteringNoNeckPainBuffer = true,
		},
	},
}
