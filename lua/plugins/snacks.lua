local enabled = { enabled = true }

---@type LazySpec
return {
	'folke/snacks.nvim',
	enabled = true,

	priority = 1000,
	lazy = false,

	---@type snacks.Config
	opts = {
		bigfile = enabled,
		bufdelete = enabled,
		quickfile = enabled,
	},
}
