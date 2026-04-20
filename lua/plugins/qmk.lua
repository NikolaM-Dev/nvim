return {
	'codethread/qmk.nvim',
	desc = 'Format qmk and zmk keymaps in neovim',
	enabled = true,

	ft = 'keymap',
	event = 'VeryLazy',

	opts = {
		name = 'glove80',
		variant = 'zmk',
		layout = {
			'x x x x x _ _ _ _ _ _ _ _ _ x x x x x',
			'x x x x x x _ _ _ _ _ _ _ x x x x x x',
			'x x x x x x _ _ _ _ _ _ _ x x x x x x',
			'x x x x x x _ _ _ _ _ _ _ x x x x x x',
			'x x x x x x x x x _ x x x x x x x x x',
			'x x x x x _ x x x _ x x x _ x x x x x',
		},
	},
}
