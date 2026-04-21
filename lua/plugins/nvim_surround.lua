---@module 'lazy.types'
---@type LazySpec
return {
	'kylechui/nvim-surround',
	desc = 'Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.',
	enabled = true,
	event = 'VeryLazy',

	---@module 'nvim-surround'
	---@type user_options
	opts = {
		move_cursor = 'sticky',
		surrounds = {
			---@see https://github.com/kylechui/nvim-surround/issues/151#issuecomment-1247901177
			['*'] = {
				add = { '**', '**' },
				find = '%*%*.-%*%*',
				delete = '^(%*%*?)().-(%*%*?)()$',
				change = {
					target = '^(%*%*?)().-(%*%*?)()$',
				},
			},
		},
	},
}
