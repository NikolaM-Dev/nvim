return {
	'shortcuts/no-neck-pain.nvim',
	enabled = true,

	keys = {
		{ '<leader>zm', '<cmd>NoNeckPain<cr>', desc = 'Toggle [Z]en [M]ode' },
	},
	config = function()
		require('no-neck-pain').setup()
	end,
}
