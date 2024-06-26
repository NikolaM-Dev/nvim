return {
	'rest-nvim/rest.nvim',
	enabled = false,
	ft = 'http',
	keys = {
		{
			'<leader>rn',
			function()
				require('rest-nvim').run()
			end,
			desc = 'Run the request under the cursor',
		},
		{
			'<leader>rp',
			function()
				require('rest_nvim').last()
			end,
			desc = 'Preview the request cURL command',
		},
		{
			'<leader>rl',
			function()
				require('rest_nvim').run(true)
			end,
			desc = 'Re-Run the last request',
		},
	},
	config = function()
		require('rest-nvim').setup({
			result = { show_headers = false },
			result_split_horizontal = true,
		})
	end,
}
