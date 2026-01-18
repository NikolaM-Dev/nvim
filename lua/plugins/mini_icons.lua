---@module 'lazy.types'
---@type LazySpec
return {
	'nvim-mini/mini.icons',
	desc = 'Icon provider',
	enabled = true,

	event = 'VeryLazy',

	---@type table
	opts = {
		filetype = {
			markdown = { glyph = '󱗖', hl = 'MiniIconsPurple' },
		},

		extension = {
			['spec.ts'] = { glyph = '󰂓', hl = 'MiniIconsCyan' },
			['test.ts'] = { glyph = '󰂓', hl = 'MiniIconsCyan' },
			['d.ts'] = { glyph = '', hl = 'MiniIconsGreen' },
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
			['.python-version'] = { glyph = '', hl = 'MiniIconsGrey' },
			['LICENSE'] = { glyph = '󰿃', hl = 'MiniIconsOrange' },
			['bun.lock'] = { glyph = '', hl = 'MiniIconsGrey' },
			['lazy-lock.json'] = { glyph = '󰒲', hl = 'MiniIconsBlue' },
			['package.json'] = { glyph = '', hl = 'MiniIconsGreen' },
			['tsconfig.json'] = { glyph = '', hl = 'MiniIconsGrey' },
		},
	},

	---@param opts? table
	config = function(_, opts)
		require('mini.icons').setup(opts)
		require('mini.icons').mock_nvim_web_devicons()
	end,
}
