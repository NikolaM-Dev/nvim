return {
	'stevearc/oil.nvim',
	cmd = 'Oil',
	keys = {
		{ '<s-tab>', '<cmd>Oil --float .<cr>' },
		{ '<tab>', '<cmd>Oil --float %:p:h<cr>' },
	},
	config = function()
		require('oil').setup({
			restore_win_options = true,
			silence_disclaimer = true,
			skip_confirm_for_simple_edits = true,
			view_options = { show_hidden = true },
			keymaps = {
				['g?'] = 'actions.show_help',
				['<CR>'] = 'actions.select',
				['<C-v>'] = 'actions.select_vsplit',
				['<C-s>'] = false,
				['<C-t>'] = 'actions.select_tab',
				['<C-p>'] = 'actions.preview',
				['<tab>'] = 'actions.close',
				['<C-l>'] = 'actions.refresh',
				['o'] = 'actions.parent',
				['_'] = 'actions.open_cwd',
				['`'] = 'actions.cd',
				['~'] = 'actions.tcd',
				['g.'] = 'actions.toggle_hidden',
			},
			float = {
				border = 'rounded',
				max_height = 20,
				max_width = 40,
				padding = 2,
				win_options = { winblend = 10 },
			},
		})
	end,
}
