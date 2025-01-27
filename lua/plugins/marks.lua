---@type LazySpec
return {
	'chentoast/marks.nvim',
	enabled = true,

	event = 'BufReadPost',

	---@type table
	opts = {
		mappings = {
			set = '\'',
		},
	},
}
