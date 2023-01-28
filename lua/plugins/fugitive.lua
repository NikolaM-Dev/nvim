return {
	'tpope/vim-fugitive',
	keys = {
		{ '<leader>g', '<cmd>:G<cr>' },
		{ '<leader>ga', '<cmd>G add %<cr>' },
		{ '<leader>gal', '<cmd>G add --all<cr>' },
		{ '<leader>gap', '<cmd>G add % -p<cr>' },
		{ '<leader>gbm', ':G branch -m ' },
		{ '<leader>gca', '<cmd>:G commit --amend<cr>' },
		{ '<leader>gcm', '<cmd>:G commit<cr>' },
		{ '<leader>gfa', '<cmd>:G fetch --all -p<cr>' },
		{ '<leader>gi', '<cmd>:G init<cr>' },
		{ '<leader>gm', ':G merge --no-ff --no-edit ' },
		{ '<leader>gma', '<cmd>:G merge --abort<cr>' },
		{ '<leader>gp', '<cmd>:G push<cr>' },
		{ '<leader>gpf', '<cmd>:G push origin -f HEAD<cr>' },
		{ '<leader>gpl', '<cmd>:G pull<cr>' },
		{ '<leader>gpo', '<cmd>:G push origin -u HEAD<cr>' },
		{ '<leader>gu', ':G reset --soft HEAD~1' },
		{ '<leader>sum', ':G stash -um ' },
	},
}