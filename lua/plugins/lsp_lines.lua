return {
	'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
	keys = {
		{
			'<leader>l',
			function()
				require('lsp_lines').toggle()
			end,
			desc = 'Show diagnostics using virtual lines',
		},
	},
	config = function()
		require('lsp_lines').setup()
	end,
}
