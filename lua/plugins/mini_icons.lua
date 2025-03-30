---@module 'lazy'
---@type LazySpec
return {
	'echasnovski/mini.icons',
	desc = 'Icon provider',
	enabled = true,

	event = 'VeryLazy',

	---@type table
	opts = {
		-- TODO: Review
		-- filetype = {
		-- 	markdown = { glyph = '󱗖', hl = 'MiniIconsPurple' },
		-- },
		-- file = {
		-- 	['bun.lockb'] = { glyph = '' },
		-- 	['lazy-lock.json'] = { glyph = '󰒲', hl = 'MiniIconsBlue' },
		-- 	['.luarc.json'] = { glyph = '󰢱', hl = 'MiniIconsAzure' },
		-- },
	},

	---@param opts? table
	config = function(_, opts)
		require('mini.icons').setup(opts)
		require('mini.icons').mock_nvim_web_devicons()
	end,
}
