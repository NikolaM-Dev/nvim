return {
	-- "williamboman/mason-lspconfig.nvim",
	'nvim-lua/plenary.nvim',

	-- Visualize startup time
	{
		'dstein64/vim-startuptime',
		cmd = 'StartupTime',
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- Quicker escape from insert mode with jj/jk
	{
		'max397574/better-escape.nvim',
		event = 'InsertEnter',
		config = true,
	},

	-- Remove trailing lines and whitespace
	{
		'cappyzawa/trim.nvim',
		event = 'BufReadPost',
		opts = {
			disable = { 'markdown' },
			patterns = {
				[[%s/\r//g]], --strip windows end of line character
			},
		},
	},
	-- makes some plugins dot-repeatable like leap
	{ 'tpope/vim-repeat', event = 'VeryLazy' },
}
