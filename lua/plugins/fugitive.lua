vim.api.nvim_create_user_command('TmuxGitCommitAmend', function()
	local command = 'tmux split-window -h "git commit --amend -v"'

	vim.fn.system(command)
end, { desc = 'Git commit amend in Tmux' })

---@type LazySpec
return {
	'tpope/vim-fugitive',
	enabled = true,

	cmd = { 'G', 'Git' },
	keys = {
		{ '<leader>ga', '<cmd>G add %<cr>', desc = '[G]it [A]dd' },
		{ '<leader>gal', '<cmd>G add --all<cr>', desc = '[G]it [A]dd A[l]l' },
		{ '<leader>gap', '<cmd>G add % -p<cr>', desc = '[G]it [A]dd [P]artial' },
		{ '<leader>gbm', ':G branch -m ', desc = '[G]it [B]ranch [M]ove' },
		-- WARN: G commit --amend don't work with fugitive
		-- { '<leader>gca', '<cmd>:G commit --amend<cr>', desc = '[G]it [C]ommit [A]mend' },
		{ '<leader>gca', '<cmd>vsplit<bar>term git commit --amend -v<cr>', desc = '[G]it [C]ommit [A]mend' },
		{ '<leader>gcm', '<cmd>G commit -v<cr>', desc = '[G]it [C]o[M]mit' },
		{ '<leader>g', '<cmd>:G<cr>', desc = '[G]it' },
		{ '<leader>gfa', '<cmd>G fetch --all -p<cr>', desc = '[G]it [F]etch [A]ll' },
		{ '<leader>gi', '<cmd>G init<cr>', desc = '[G]it [I]nit' },
		{ '<leader>gma', '<cmd>G merge --abort<cr>', desc = '[G]it [M]erge [A]bort' },
		{ '<leader>gm', ':G merge --no-ff --no-edit ', desc = '[G]it [M]erge' },
		{ '<leader>gp', '<cmd>G push<cr>', desc = '[G]it [P]ush' },
		{ '<leader>gpf', '<cmd>G push origin -f HEAD<cr>', desc = '[G]it [P]ush origin [F]orce' },
		{ '<leader>gpl', '<cmd>G pull<cr>', desc = '[G]it [P]u[l]l' },
		{ '<leader>gpo', '<cmd>G push origin -u HEAD<cr>', desc = '[G]it [P]ush [O]rigin' },
		{ '<leader>gu', ':G reset --soft HEAD~1', desc = '[G]it [U]ndo' },
		{ '<leader>sum', ':G stash -um ', desc = 'Git [S]tash [UM]' },
	},
}
