return {
	'phaazon/mind.nvim',
	keys = {
		{ '<leader><leader>n', '<cmd>MindOpenProject<cr>', desc = 'Mind Open Project' },
		{
			'<leader>n',
			function()
				if vim.bo.filetype ~= 'mind' then
					vim.api.nvim_command('MindOpenMain')
				else
					vim.api.nvim_command('MindClose')
				end
			end,
			desc = 'Mind Open Main | Mind Close',
		},
	},
	config = true,
}
