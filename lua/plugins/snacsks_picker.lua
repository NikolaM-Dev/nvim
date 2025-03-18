---@type LazySpec
return {
	'folke/snacks.nvim',
	enabled = true,

	keys = {
		{
			'<leader>ff',
			function()
				-- TODO: Learn how it works and whats the difference with `find_files`
				Snacks.picker.smart()
			end,
			desc = '[F]ind [F]iles with Smart Open',
		},
	},
}
