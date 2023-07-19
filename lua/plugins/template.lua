return {
	'nvimdev/template.nvim',
	cmd = { 'Template' },
	event = { 'VeryLazy' },
	keys = {
		{
			'<leader>tem',
			'<cmd>Telescope find_template type=insert<cr>',
			desc = 'Find [TEM]plates',
		},
	},
	config = function()
		require('template').setup({
			author = 'Juan David Merchan Torres <NikolaM-Dev>',
			email = 'juan1014166@gmail.com',
			temp_dir = '~/.config/nvim/templates',
		})

		require('telescope').load_extension('find_template')
	end,
}
