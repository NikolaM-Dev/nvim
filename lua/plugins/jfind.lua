return {
	'jake-stewart/jfind.nvim',
	keys = {
		{ '<leader>ff', desc = 'j[J]find' },
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
