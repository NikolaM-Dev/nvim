---@type LazySpec
return {
	'arnamak/stay-centered.nvim',
	enabled = true,

	ft = { 'markdown' },
	keys = {
		{
			'<leader>sc',
			function()
				require('stay-centered').toggle()
			end,
			desc = 'Toggle  [S]tay [C]entered',
		},
	},
	config = function()
		require('stay-centered').setup({
			enabled = false,
		})
	end,
}
