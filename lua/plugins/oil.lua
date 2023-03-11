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
			-- TODO: Add better reconize
			view_options = { show_hidden = false },
			keymaps = {
				['`'] = 'actions.cd',
				['_'] = 'actions.open_cwd',
				['-'] = 'actions.parent',
				['~'] = 'actions.tcd',
				['<C-l>'] = 'actions.refresh',
				['<C-p>'] = 'actions.preview',
				['<CR>'] = 'actions.select',
				['<C-s>'] = false,
				['<C-t>'] = 'actions.select_tab',
				['<C-v>'] = 'actions.select_vsplit',
				['g?'] = 'actions.show_help',
				['g.'] = 'actions.toggle_hidden',
				['<leader>e'] = 'actions.close',
			},
		})
	end,
}
