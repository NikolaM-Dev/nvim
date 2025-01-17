---@type LazySpec
return {
	'folke/which-key.nvim',
	enabled = true,

	event = 'VeryLazy',

	---@type wk.Opts
	opts = {
		delay = 350,
	},
}
