return {
	'stevearc/oil.nvim',
	cmd = 'Oil',
	keys = {
		{ '<leader><leader>e', '<cmd>Oil .<cr>' },
		{ '<leader>e', '<cmd>Oil %:p:h<cr>' },
	},
	config = function()
		require('oil').setup({
			restore_win_options = true,
			silence_disclaimer = true,
			skip_confirm_for_simple_edits = true,
			view_options = { show_hidden = true },
			keymaps = {
				['`'] = 'actions.cd',
				['_'] = 'actions.open_cwd',
				['~'] = 'actions.tcd',
				['<C-l>'] = 'actions.refresh',
				['<C-p>'] = 'actions.preview',
				['<CR>'] = 'actions.select',
				['<C-s>'] = false,
				['<C-t>'] = 'actions.select_tab',
				['g?'] = 'actions.show_help',
				['g.'] = 'actions.toggle_hidden',
				['-'] = 'actions.parent',
				['<leader>e'] = 'actions.close',
			},
		})
	end,
}
