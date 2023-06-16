local function hide_file(file_name)
	local is_hide = false
	local filters = {
		'^dist$',
		'^.git$',
		'^.mind$',
		'^node_modules$',
	}

	for _, f in pairs(filters) do
		if string.match(file_name, f) then
			is_hide = true

			break
		end
	end

	return is_hide
end

return {
	'stevearc/oil.nvim',
	cmd = 'Oil',
	keys = {
		{ '<leader>;e', '<cmd>Oil .<cr>', desc = 'Open Oil Root Path' },
		{ '<leader>e', '<cmd>Oil %:p:h<cr>', desc = 'Open Oil Current Path' },
	},
	config = function()
		require('oil').setup({
			columns = {
				{ 'icon', default_file = '󰈙', directory = '󰉋' },
			},
			restore_win_options = true,
			silence_disclaimer = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = false,
				is_hidden_file = function(file_name)
					return hide_file(file_name)
				end,
			},
			keymaps = {
				['`'] = 'actions.cd',
				['_'] = 'actions.open_cwd',
				['-'] = 'actions.parent',
				['~'] = 'actions.tcd',
				['<C-h>'] = false,
				['<C-l>'] = false,
				['<C-p>'] = 'actions.preview',
				['<CR>'] = 'actions.select',
				['<C-s>'] = false,
				['<C-t>'] = 'actions.select_tab',
				['<C-v>'] = 'actions.select_vsplit',
				['<C-x>'] = 'actions.select_split',
				['g?'] = 'actions.show_help',
				['g.'] = 'actions.toggle_hidden',
				['<leader>e'] = 'actions.close',
				['<leader>r'] = 'actions.refresh',
			},
		})
	end,
}
