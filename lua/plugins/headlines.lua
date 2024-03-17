return {
	'lukas-reineke/headlines.nvim',
	event = 'BufRead',
	dependencies = 'nvim-treesitter/nvim-treesitter',
	config = function()
		-- Define custom highlight groups using Vimscript
		vim.cmd([[highlight Headline1 guibg=#f38ba8 guifg=#09090d]])
		vim.cmd([[highlight Headline2 guibg=#fab387 guifg=#09090d]])
		vim.cmd([[highlight Headline3 guibg=#a6e3a1 guifg=#09090d]])
		vim.cmd([[highlight Headline4 guibg=#94e2d5 guifg=#09090d]])
		vim.cmd([[highlight Headline5 guibg=#b4befe guifg=#09090d]])
		vim.cmd([[highlight Headline6 guibg=#cba6f7 guifg=#09090d]])

		-- Defines the codeblock background color to something darker
		vim.cmd([[highlight CodeBlock guibg=#11111b]])

		-- When you add a line of dashes with --- this specifies the color, I'm not
		-- adding a "guibg" but you can do so if you want to add a background color
		vim.cmd([[highlight Dash guifg=white]])

		-- Setup headlines.nvim with the newly defined highlight groups
		require('headlines').setup({
			markdown = {
				bullets = { '', '', '', '', '', '' },
				codeblock_highlight = 'CodeBlock',
				dash_highlight = 'Dash',
				dash_string = '󰨐',
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
