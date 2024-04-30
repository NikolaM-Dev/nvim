return {
	'nvim-treesitter/nvim-treesitter-context',
	event = 'BufReadPre',
	cmd = { 'TSContextDisable', 'TSContextEnable', 'TSContextToggle' },
	keys = {
		{
			';gc',
			function()
				require('treesitter-context').go_to_context()
			end,
			desc = '[G]oto [C]ontext',
		},
		{
			'<leader>tc',
			'<cmd>TSContextToggle<cr>',
			desc = '[T]oggle [C]ontext',
		},
	},
	config = function()
		local PALETTE = require('catppuccin.palettes').get_palette('mocha')
		local bg = '#2a2b3c'

		vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = bg })
		vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { fg = PALETTE.lavender })
		vim.api.nvim_set_hl(0, 'TreesitterContextLineNumberBottom', { fg = PALETTE.lavender })

		require('treesitter-context').setup({
			max_lines = 3,
		})
	end,
}
