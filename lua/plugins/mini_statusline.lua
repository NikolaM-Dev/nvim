---@module 'lazy.types'
---@type LazySpec
return {
	'nvim-mini/mini.statusline',
	desc = 'Neovim Lua plugin with minimal and fast statusline. Part of \'mini.nvim\' library',
	enabled = true,

	config = function()
		require('mini.statusline').setup()
	end,
}
