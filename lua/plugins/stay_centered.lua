---@module 'lazy.types'
---@type LazySpec
return {
	'arnamak/stay-centered.nvim',
	desc = 'A neovim plugin to keep your cursor at the center of the screen',
	enabled = true,

	keys = {
		{
			'<leader>usc',
			function()
				local opts = { title = 'Stay Centered' }
				local stay_centered = require('stay-centered')

				stay_centered.toggle()

				if stay_centered.cfg.enabled then
					Snacks.notify.info('Stay Centered enabled', opts)
				else
					Snacks.notify.warn('Stay Centered disabled', opts)
				end
			end,
			desc = 'Toggle [S]tay [C]entered',
		},
	},

	---@type table
	opts = {
		enabled = false,
	},
}
