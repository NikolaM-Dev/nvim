return {
	'NvChad/nvim-colorizer.lua',
	event = 'BufReadPre',
	config = function()
		require('colorizer').setup({
			buftype = { '*' },
			filetypes = { '*', '!checkhealth', '!lazy', '!lspinfo', '!mason', '!null-ls-info' },
			user_default_options = {
				AARRGGBB = true,
				css = true,
				css_fn = true,
				mode = 'background',
				rgb_fn = true,
				RRGGBBAA = true,
				sass = { enable = true, parsers = { css } },
				tailwind = 'both',
				virtualtext = '■',
			},
		})
	end,
}
