return {
	'b0o/incline.nvim',
	event = 'BufReadPre',
	opts = function()
		local c = require('tokyonight.colors').setup()

		return {
			highlight = { groups = { InclineNormal = { guifg = c.fg, guibg = c.bg } } },
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':p:.')
				local ft_icon, ft_color = require('nvim-web-devicons').get_icon_color(filename)
				local modified = vim.api.nvim_buf_get_option(props.buf, 'modified') and '  ' or ''

				return {
					{ modified, guifg = c.orange },
					{ ft_icon, guifg = ft_color },
					{ ' ' },
					{ filename },
				}
			end,
			window = {
				margin = { horizontal = 0, vertical = 0 },
				padding = { left = 1, right = 0 },
			},
		}
	end,
}
