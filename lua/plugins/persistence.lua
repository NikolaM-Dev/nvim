return {
	'folke/persistence.nvim',
	enabled = false,
	event = 'BufReadPre',
	keys = {
		{
			'<leader>rs',
			function()
				require('persistence').load()
			end,
			desc = '[R]estore [S]ession',
		},
	},
	config = function()
		require('persistence').setup({
			options = vim.opt.sessionoptions:get(),
			pre_save = function()
				vim.cmd.mkview()
			end,
		})
	end,
}
