return {
	'rest-nvim/rest.nvim',
	ft = 'http',
	keys = {
		{ '<leader>rn', '<cmd>RestNvim<cr>', desc = 'Run the request under the cursor' },
		{ '<leader>rp', '<cmd>RestNvimPreview<cr>', desc = 'Preview the request cURL command' },
		{ '<leader>rl', '<cmd>RestNvimLast<cr>', desc = 'Re-Run the last request' },
	},
}
