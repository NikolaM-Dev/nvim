return {
	'jake-stewart/jfind.nvim',
	branch = '1.0',
	enabled = false,
	keys = {
		{
			'<leader>;ff',
			function()
				local Key = require('jfind.key')

				require('jfind').findFile({
					formatPaths = true,
					callback = {
						[Key.CTRL_V] = vim.cmd.vsplit,
						[Key.CTRL_X] = vim.cmd.split,
						[Key.DEFAULT] = vim.cmd.edit,
					},
				})
			end,
		},
	},
	config = function()
		require('jfind').setup({
			exclude = {
				'build',
				'.class',
				'dist',
				'.git',
				'.idea',
				'*.iml',
				'*.meta',
				'node_modules',
				'__pycache__',
				'.sass-cache',
				'target',
				'tmp',
			},
			border = 'rounded',
			tmux = true,
		})
	end,
}
