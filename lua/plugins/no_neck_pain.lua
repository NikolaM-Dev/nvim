return {
	'shortcuts/no-neck-pain.nvim',
	enabled = true,
	keys = {
		{ '<leader>zm', '<cmd>NoNeckPain<cr>', desc = 'Toggle No Neck Pain' },
	},
	config = function()
		require('no-neck-pain').setup()
	end,
}
