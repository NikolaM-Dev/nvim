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
			desc = 'Next todo comment',
		},
		{
			'<leader>tk',
			function()
				require('todo-comments').jump_prev()
			end,
			desc = 'Previous todo comment',
		},
		{ '<leader>;t', '<cmd>TodoTrouble<cr>', desc = 'Todo (Trouble)' },
		{ '<leader>ft', '<cmd>TodoTelescope<cr>', desc = 'Todo' },
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
