return {
	'NvChad/nvim-colorizer.lua',
	event = 'BufReadPre',
	opts = {
		buftype = { '*', '!prompt', '!nofile' },
		filetypes = { '*', '!lazy' },
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
	},
}
