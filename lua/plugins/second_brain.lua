return {
	'NikolaM-Dev/second-brain.nvim',
	lazy = false,
	enabled = false,
	keys = {
		{
			'<leader>gt',
			function()
				require('second-brain').telescope.find_nvim_config()
			end,
		},
	},
	config = function()
		require('second-brain').setup()
	end,
}
