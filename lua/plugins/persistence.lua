return {
	'folke/persistence.nvim',
	enabled = true,
	event = 'BufReadPre',
	keys = {
		{
			'<leader>ls',
			function()
				require('persistence').load()
			end,
			desc = '[L]ast [S]ession',
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
