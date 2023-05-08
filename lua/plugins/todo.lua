return {
	'folke/todo-comments.nvim',
	cmd = { 'TodoTelescope', 'TodoTrouble' },
	event = { 'BufReadPost', 'BufNewFile' },
	keys = {
		{
			'<leader>tj',
			function()
				require('todo-comments').jump_next()
			end,
			desc = 'Next [T]odo Comment',
		},
		{
			'<leader>tk',
			function()
				require('todo-comments').jump_prev()
			end,
			desc = 'Previous [T]odo Comment',
		},
		{ '<leader>ft', '<cmd>TodoTelescope<cr>', desc = 'Find [T]odo' },
		{ '<leader>;t', '<cmd>TodoTrouble<cr>', desc = '[T]odo Trouble' },
	},
	config = function()
		require('todo-comments').setup({
			keywords = {
				FIX = { icon = ' ' },
				HACK = { icon = ' ' },
				NOTE = { icon = ' ' },
				PERF = { icon = ' ' },
				TEST = { icon = '󰂖 ' },
				TODO = { icon = ' ' },
				WARN = { icon = ' ' },
			},
		})
	end,
}
