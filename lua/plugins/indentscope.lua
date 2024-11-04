---@type LazySpec
return {
	'echasnovski/mini.indentscope',
	enabled = true,
	event = 'VeryLazy',
	config = function()
		require('mini.indentscope').setup({
			draw = { animation = require('mini.indentscope').gen_animation.none() },
			symbol = '│',
		})

		vim.api.nvim_command('highlight! MiniIndentscopeSymbol guibg=NONE guifg=#45475a')
	end,
}
