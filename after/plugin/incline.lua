local status_ok, incline = pcall(require, 'incline')
if not status_ok then
	return
end

local colors = require('tokyonight.colors').setup()

incline.setup({
	debounce_threshold = {
		falling = 50,
		rising = 10,
	},
	hide = {
		cursorline = false,
		focused_win = false,
		only_win = false,
	},
	highlight = {
		groups = { InclineNormal = { guifg = colors.fg, guibg = colors.bg } },
	},
	ignore = {
		buftypes = 'special',
		filetypes = {},
		floating_wins = true,
		unlisted_buffers = true,
		wintypes = 'special',
	},
	render = function(props)
		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
		local ft_icon, ft_color = require('nvim-web-devicons').get_icon_color(filename)
		local modified = vim.api.nvim_buf_get_option(props.buf, 'modified') and 'ﭦ  ' or ''

		return {
			{ modified, guifg = colors.orange },
			{ ft_icon, guifg = ft_color },
			{ ' ' },
			{ filename },
		}
	end,
	window = {
		margin = {
			horizontal = 0,
			vertical = 0,
		},
		options = {
			signcolumn = 'no',
			wrap = false,
		},
		padding = {
			left = 1,
			right = 0,
		},
		padding_char = ' ',
		placement = {
			horizontal = 'right',
			vertical = 'top',
		},
		width = 'fit',
		winhighlight = {
			active = {
				EndOfBuffer = 'None',
				Normal = 'InclineNormal',
				Search = 'None',
			},
			inactive = {
				EndOfBuffer = 'None',
				Normal = 'InclineNormalNC',
				Search = 'None',
			},
		},
		zindex = 50,
	},
})
