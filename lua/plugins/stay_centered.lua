local Logger = require('lib.logger'):new('Stay Centered')

---Is stay centered enabled
---@type boolean
local is_enable = false

---@type LazySpec
return {
	'arnamak/stay-centered.nvim',
	enabled = true,

	ft = { 'markdown' },
	keys = {
		{
			'<leader>sc',
			function()
				if is_enable then
					require('stay-centered').disable()
					Logger:warn('Stay Centered disabled')
				else
					require('stay-centered').enable()
					Logger:info('Stay Centered enabled')
				end

				is_enable = not is_enable
			end,
			desc = 'Toggle  [S]tay [C]entered',
		},
	},
	opts = {
		enabled = false,
	},
}
