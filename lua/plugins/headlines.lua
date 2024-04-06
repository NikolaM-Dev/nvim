return {
	'lukas-reineke/headlines.nvim',
	ft = 'markdown',
	dependencies = { 'catppuccin/nvim', 'nvim-treesitter/nvim-treesitter' },
	config = function()
		vim.cmd('highlight Headline1 guibg=#f38ba8 guifg=#09090d')
		vim.cmd('highlight Headline2 guibg=#fab387 guifg=#09090d')
		vim.cmd('highlight Headline3 guibg=#a6e3a1 guifg=#09090d')
		vim.cmd('highlight Headline4 guibg=#94e2d5 guifg=#09090d')
		vim.cmd('highlight Headline5 guibg=#b4befe guifg=#09090d')
		vim.cmd('highlight Headline6 guibg=#cba6f7 guifg=#09090d')

		vim.cmd('highlight CodeBlock guibg=#11111b')

		vim.cmd('highlight Dash guifg=#89b4fa')
		vim.cmd('highlight @markup.italic guifg=#a6e3a1')
		vim.cmd('highlight @markup.strong guifg=#eba0ac')
		vim.cmd('highlight Quote guifg=#9399b2')

		-- Setup headlines.nvim with the newly defined highlight groups
		require('headlines').setup({
			markdown = {
				bullets = { '', '', '', '', '', '' },
				codeblock_highlight = 'CodeBlock',
				dash_highlight = 'Dash',
				dash_string = '',
				fat_headline_lower_string = '▀',
				fat_headlines = false,
				fat_headline_upper_string = '▀',
				headline_highlights = { 'Headline1', 'Headline2', 'Headline3', 'Headline4', 'Headline5', 'Headline6' },
				quote_highlight = 'Quote',
				quote_string = '',
			},
		})
	end,
}
