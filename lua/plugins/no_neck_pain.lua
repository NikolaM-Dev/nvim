---@module 'lazy'
---@type LazySpec
return {
	'shortcuts/no-neck-pain.nvim',
	desc = '☕ Dead simple yet super extensible zen mode plugin to protect your neck.',
	enabled = true,

	keys = {
		{ '<leader>zm', '<cmd>NoNeckPain<cr>', desc = 'Toggle [Z]en [M]ode' },
	},

	---@type table
	opts = {
		width = 90,
	},
}
