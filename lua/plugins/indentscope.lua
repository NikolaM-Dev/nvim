return {
	'echasnovski/mini.indentscope',
	event = 'VeryLazy',
	config = function()
		require('mini.indentscope').setup({ symbol = '│' })

		vim.api.nvim_command('highlight! MiniIndentscopeSymbol guibg=NONE guifg=#45475a')
	end,
}
