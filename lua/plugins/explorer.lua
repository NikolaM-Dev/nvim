return {
	'nvim-tree/nvim-tree.lua',
	cmd = 'NvimTreeToggle',
	keys = {
		{ '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'Explorer' },
		{ '<leader><leader>e', '<cmd>NvimTreeCollapse<CR>', desc = 'Collapse recursively' },
	},
	config = function()
		require('nvim-tree').setup({
			view = {
				mappings = {
					list = {
						{ key = 'f', action = '' },
						{ key = 'F', action = '' },
						{ key = 'o', action = 'cd' },
					},
				},
			},
			renderer = {
				icons = {
					glyphs = {
						bookmark = '',
						default = '',
						symlink = '',
						modified = '●',
						folder = {
							arrow_closed = '',
							arrow_open = '',
							default = '',
							empty = '󰉖',
							empty_open = '󰷏',
							open = 'ﱮ',
							symlink = '󰉒',
							symlink_open = '󰉒',
						},
						git = {
							deleted = '',
							ignored = '',
							renamed = '',
							staged = '',
							unmerged = '',
							unstaged = '',
							untracked = 'ﲉ',
						},
					},
				},
			},
			filters = { custom = { '^.git$', '^node_modules$' } },
			git = { ignore = false },
			update_focused_file = { enable = true },
		})
	end,
}
