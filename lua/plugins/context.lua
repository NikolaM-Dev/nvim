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
	},
	config = function()
		require('treesitter-context').setup()
	end,
}
