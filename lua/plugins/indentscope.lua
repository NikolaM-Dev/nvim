---@type LazySpec
return {
	'echasnovski/mini.indentscope',
	enabled = true,

	event = 'VeryLazy',

	---@type table
	opts = {
		options = {
			try_as_border = true,
		},
		symbol = '│',
	},

	init = function()
		vim.api.nvim_create_autocmd('FileType', {
			pattern = {
				'snacks_dashboard',
				-- ...
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})

		vim.api.nvim_create_autocmd('User', {
			pattern = 'SnacksDashboardOpened',
			desc = 'Disable mini indentscope in Snacks Dashboard',
			group = _G.augroup('disable_mini_indentscope'),
			callback = function(data)
				vim.b[data.buf].miniindentscope_disable = true
			end,
		})
	end,

	---@param opts? table
	config = function(_, opts)
		opts.draw = { animation = require('mini.indentscope').gen_animation.none() }

		require('mini.indentscope').setup(opts)
	end,
}
