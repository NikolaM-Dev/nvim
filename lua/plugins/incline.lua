---@module 'lazy.types'
---@type LazySpec
return {
	'b0o/incline.nvim',
	desc = '🎈 Floating statuslines for Neovim',
	enabled = true,
	event = 'VeryLazy',

	config = function()
		require('incline').setup({
			highlight = {
				groups = {
					InclineNormal = {
						default = true,
						group = 'Winbar',
					},
					InclineNormalNC = {
						default = true,
						group = 'WinbarNC',
					},
				},
			},
			render = function(props)
				local buf = vim.api.nvim_buf_get_name(props.buf)

				if buf == '' then
					return nil
				end

				local parent = vim.fn.fnamemodify(buf, ':p:h:t')
				local filename = vim.fn.fnamemodify(buf, ':t')
				local display = parent .. '/' .. filename

				local Winbar = display
				if vim.api.nvim_get_option_value('modified', { buf = props.buf }) then
					Winbar = '[+] ' .. Winbar
				end

				return Winbar
			end,
			window = {
				margin = {
					horizontal = 0,
					vertical = 0,
				},
				padding = 0,
			},
		})
	end,
}
