return {
	'jake-stewart/jfind.nvim',
	enabled = false,
	branch = '1.0',
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
			border = 'single',
			tmux = true,
		})
	end,
}
