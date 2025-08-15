---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'echasnovski/mini.icons',
	desc = 'Icon provider',
	enabled = true,

	event = 'VeryLazy',

	---@type table
	opts = {
		filetype = {
			markdown = { glyph = '󱗖', hl = 'MiniIconsPurple' },
		},

		extension = {
			c = { glyph = '' },
			h = { glyph = '' },
			o = { glyph = '󰆧' },
		},

		file = {
			['.node-version'] = { glyph = '', hl = 'MiniIconsGreen' },
			['.npmrc'] = { glyph = '󰝆', hl = 'MiniIconsRed' },
			['.obsidian.vimrc'] = { glyph = '', hl = 'MiniIconsGreen' },
			['.prettierignore'] = { glyph = '', hl = 'MiniIconsPurple' },
			['.prettierrc'] = { glyph = '', hl = 'MiniIconsBlue' },
			['LICENSE'] = { glyph = '󰄤' },
			['bun.lock'] = { glyph = '', hl = 'MiniIconsGrey' },
			['lazy-lock.json'] = { glyph = '󰒲', hl = 'MiniIconsBlue' },
			['package.json'] = { glyph = '', hl = 'MiniIconsGreen' },
		},
	},

	---@param opts? table
	config = function(_, opts)
		require('mini.icons').setup(opts)
		require('mini.icons').mock_nvim_web_devicons()
	end,
}
