---@module 'lazy'
---@type LazySpec
return {
	'tpope/vim-fugitive',
	desc = 'Git wrapper by tpope',
	enabled = true,

	cmd = 'Git',

	keys = {
		-- stylua: ignore start
		{ '<leader>gca', ':vert Git commit -v --amend<cr>', desc = '[G]it [C]ommit [A]mend' },
		{ '<leader>gcm', ':vert Git commit -v<cr>',         desc = '[G]it [C]o[M]mit' },
		{ '<leader>gi',  '<cmd>Git init<cr>',               desc = '[G]it [I]nit' },
		-- stylua: ignore end
	},
}
