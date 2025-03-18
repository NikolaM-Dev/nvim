---@type LazySpec
return {
	'folke/snacks.nvim',
	enabled = true,

	---@type snacks.Config
	opts = {
		scroll = { enabled = false },
		explorer = { enabled = false },
	},

	keys = function()
		return {}
	end,
}
