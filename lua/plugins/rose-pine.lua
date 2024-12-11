-- moon palette
local palette = {
	_NC = '_nc', -- #1f1d30
	BASE = 'base', -- #232136
	SURFACE = 'surface', -- #2a273f
	OVERLAY = 'overlay', -- #393552
	MUTED = 'muted', -- #6e6a86
	SUBTLE = 'subtle', -- #908caa
	TEXT = 'text', -- #e0def4
	LOVE = 'love', -- #eb6f92
	GOLD = 'gold', -- #f6c177
	ROSE = 'rose', -- #ea9a97
	PINE = 'pine', -- #3e8fb0
	FOAM = 'foam', -- #9ccfd8
	IRIS = 'iris', -- #c4a7e7
	LEAF = 'leaf', -- #95b1ac
	HIGHLIGHT_LOW = 'highlight_low', -- #2a283e
	HIGHLIGHT_MED = 'highlight_med', -- #44415a
	HIGHLIGHT_HIGH = 'highlight_high', -- #56526e
	NONE = 'none', -- NONE
}

---@type LazySpec
return {
	'rose-pine/neovim',
	enabled = true,

	lazy = false,
	priority = 1000,
	name = 'rose-pine',

	---@type table
	opts = {
	},

	---@param opts table
	config = function(_, opts)
		require('rose-pine').setup(opts)

		vim.cmd.colorscheme('rose-pine-moon')
	end,
}
