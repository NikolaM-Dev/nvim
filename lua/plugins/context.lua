---@type LazySpec
return {
	'nvim-treesitter/nvim-treesitter-context',
	enabled = true,

	event = 'BufReadPre',
	cmd = { 'TSContextDisable', 'TSContextEnable', 'TSContextToggle' },
	keys = {
		{
			';gc',
			function()
				require('treesitter-context').go_to_context(vim.v.count1)
			end,
			desc = '[G]oto [C]ontext',
			mode = { 'n', 'v' },
		},
		{
			'<leader>tc',
			'<cmd>TSContextToggle<cr>',
			desc = '[T]oggle [C]ontext',
		},
	},

	---@type TSContext.UserConfig
	opts = { max_lines = 3 },

	---@param opts TSContext.UserConfig
	config = function(_, opts)
		local PALETTE = require('catppuccin.palettes').get_palette('mocha')

		vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = PALETTE.base })
		vim.api.nvim_set_hl(0, 'TreesitterContextLineNumberBottom', { fg = PALETTE.lavender })
		vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { fg = PALETTE.lavender })

		require('treesitter-context').setup(opts)
	end,
}
