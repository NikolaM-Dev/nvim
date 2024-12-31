---@type LazySpec
return {
	'echasnovski/mini.icons',
	enabled = true,

	---@type table
	opts = {
		filetype = {
			markdown = { glyph = '󱗖', hl = 'MiniIconsPurple' },
		},
		file = {
			['lazy-lock.json'] = { glyph = '󰒲', hl = 'MiniIconsBlue' },
			['.luarc.json'] = { glyph = '󰢱', hl = 'MiniIconsAzure' },
		},
	},

	init = function()
		package.preload['nvim-web-devicons'] = function()
			require('mini.icons').mock_nvim_web_devicons()

			return package.loaded['nvim-web-devicons']
		end
	end,
}
