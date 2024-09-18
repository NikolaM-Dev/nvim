---@type LazySpec
return {
	'j-hui/fidget.nvim',
	enabled = true,

	event = 'VeryLazy',
	version = '*',
	opts = {
		progress = {
			display = {
				done_icon = '󰄳',
				done_ttl = 1,
				progress_icon = {
					pattern = { '󰺕', '󰪞', '󰪟', '󰪠', '󰪡', '󰪢', '󰪣', '󰪤', '󰪥' },
				},
			},
		},
		notification = {
			window = {
				winblend = 0,
			},
		},
	},
	config = function(_, opts)
		require('fidget').setup(opts)
	end,
}
