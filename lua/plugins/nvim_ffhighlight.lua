return {
	'kevinhwang91/nvim-fFHighlight',
	desc = 'Highlight f and F in Neovim',
	enabled = true,

	keys = {
		{
			'f',
			function()
				require('eyeliner').highlight({ forward = true })
				return [[<Cmd>lua require('fFHighlight').findChar()<CR>]]
			end,
			mode = { 'n', 'x', 'o' },
			expr = true,
			desc = ' Clever f',
		},
		{
			'F',
			function()
				require('eyeliner').highlight({ forward = false })
				return [[<Cmd>lua require('fFHighlight').findChar(true)<CR>]]
			end,
			mode = { 'n', 'x', 'o' },
			expr = true,
			desc = ' Clever F',
		},
	},
	config = function()
		require('fFHighlight').setup({
			disable_keymap = true,
			disable_words_hl = true,
			number_hint_threshold = 2,
			prompt_sign_define = {},
		})
	end,
}
