---@module 'lazy'
---@type LazySpec
return {
	'tpope/vim-fugitive',
	desc = 'Git wrapper by tpope',
	enabled = true,

	cmd = 'Git',
	keys = {
		{
			'<leader>gcm',
			':vert Git commit -v<cr>',
			desc = '[G]it [C]o[M]mit',
		},
		{
			'<leader>gca',
			':vert Git commit -v --amend<cr>',
			desc = '[G]it [C]ommit [A]mend',
		},
	},
}
