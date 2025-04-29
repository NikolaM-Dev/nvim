---Is stay centered enabled
---@type boolean
local is_enable = false

---
---@module 'lazy'
---@type LazySpec
return {
	'arnamak/stay-centered.nvim',
	desc = 'A neovim plugin to keep your cursor at the center of the screen',
	enabled = true,

	ft = { 'markdown', 'txt' },

	keys = {
		{
			'<leader>sc',
			function()
				local title = 'Stay Centered'

				if is_enable then
					require('stay-centered').disable()
					Snacks.notify.warn('Stay Centered disabled', { title = title })
				else
					require('stay-centered').enable()
					Snacks.notify.info('Stay Centered enabled', { title = title })
				end

				is_enable = not is_enable
			end,
			desc = 'Toggle [S]tay [C]entered',
		},
	},

	---@type table
	opts = {
		enabled = false,
	},
}
