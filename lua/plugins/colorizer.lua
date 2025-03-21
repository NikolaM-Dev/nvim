-- TODO: this is deprecated

---@type LazySpec
return {
	'NvChad/nvim-colorizer.lua',
	enabled = false,

	event = 'BufReadPre',
	config = function()
		require('colorizer').setup({
			buftype = { '*' },
			filetypes = { '*', '!checkhealth', '!lazy', '!lspinfo', '!mason', '!null-ls-info', '!markdown' },
			user_default_options = {
				AARRGGBB = true,
				css_fn = true,
				css = true,
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
