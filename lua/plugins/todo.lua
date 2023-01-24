return {
	'folke/todo-comments.nvim',
	cmd = { 'TodoTelescope', 'TodoTrouble' },
	config = true,
	event = 'BufReadPost',
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
}
