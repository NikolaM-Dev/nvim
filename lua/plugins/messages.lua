---@module 'lazy.types'
---@type LazySpec
return {
	'AckslD/messages.nvim',
	desc = 'Capture and show any messages in a customisable (floating) buffer',
	enabled = true,

	cmd = 'Msg',

	opts = {
		command_name = 'Msg',
		buffer_opts = function(lines)
			local gheight = vim.api.nvim_list_uis()[1].height
			local gwidth = vim.api.nvim_list_uis()[1].width
			local clip_val = require('messages.utils').clip_val

			return {
				anchor = 'SW',
				border = vim.o.winborder,
				col = 0,
				height = math.floor(clip_val(1, #lines, gheight * 0.5)),
				relative = 'editor',
				row = gheight - 1,
				style = 'minimal',
				width = gwidth - 2,
				zindex = 1,
			}
		end,
	},
}
