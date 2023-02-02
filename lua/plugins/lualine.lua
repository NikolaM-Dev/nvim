local M = {
	'nvim-lualine/lualine.nvim',
	event = 'VimEnter',
}

function M.config()
	local function buffer_not_empty()
		return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
	end

	local function hide_in_width()
		return vim.fn.winwidth(0) > 80
	end

	local c = require('tokyonight.colors').setup()

	local function get_color_mode()
		local color_mode = {
			['!'] = c.red,
			[''] = c.blue,
			[''] = c.orange,
			['r?'] = c.cyan,
			c = c.magenta,
			ce = c.red,
			cv = c.red,
			i = c.green,
			ic = c.yellow,
			n = c.red,
			no = c.red,
			r = c.cyan,
			R = c.magenta,
			rm = c.cyan,
			Rv = c.magenta,
			s = c.orange,
			S = c.orange,
			t = c.red,
			v = c.blue,
			V = c.blue,
		}

		return { fg = color_mode[vim.fn.mode()] }
	end

	local config = {
		options = {
			component_separators = '',
			section_separators = '',
			theme = {
				inactive = { c = { fg = c.fg, bg = c.bg } },
				normal = { c = { fg = c.fg, bg = c.bg } },
			},
		},
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	}

	local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	end

	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end

	ins_left({
		function()
			return '▊'
		end,
		color = { fg = c.blue },
		padding = { left = 0, right = 1 },
	})

	ins_left({
		function()
			return ''
		end,
		color = get_color_mode(),
		padding = { right = 2 },
	})

	ins_left({
		'filesize',
		cond = buffer_not_empty,
		padding = { right = 1 },
	})

	ins_left({
		'filetype',
		cond = buffer_not_empty,
		icon_only = true,
		padding = { right = 1 },
	})

	ins_left({
		'filename',
		color = { gui = 'bold' },
		cond = buffer_not_empty,
		padding = { right = 1 },
	})

	ins_left({ 'location', padding = { right = 1 } })

	ins_left({
		'progress',
		color = { fg = c.fg, gui = 'bold' },
		padding = { right = 1 },
	})

	ins_left({
		'diagnostics',
		sources = { 'nvim_diagnostic' },
		symbols = { error = ' ', hint = ' ', info = ' ', warn = '  ' },
		diagnostics_color = {
			color_error = { fg = c.red },
			color_hint = { fg = c.green },
			color_info = { fg = c.cyan },
			color_warn = { fg = c.yellow },
		},
	})

	ins_left({
		function()
			return '%='
		end,
	})

	ins_left({
		function()
			local default = 'No Active Lsp'
			local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
			local clients = vim.lsp.get_active_clients()

			if next(clients) == nil then
				return default
			end

			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end

			return default
		end,
		icon = ' LSP:',
		color = { fg = c.magenta, gui = 'bold' },
		padding = { left = 0, right = 0 },
	})

	ins_right({
		'o:encoding',
		color = { fg = c.green, gui = 'bold' },
		cond = hide_in_width,
		fmt = string.upper,
		padding = { right = 1 },
	})

	ins_right({
		'fileformat',
		fmt = string.upper,
		icons_enabled = false,
		color = { fg = c.green, gui = 'bold' },
		padding = { right = 1 },
	})

	ins_right({
		'branch',
		color = { fg = c.magenta, gui = 'bold' },
		icon = '',
		padding = { right = 1 },
	})

	ins_right({
		'diff',
		cond = hide_in_width,
		diff_color = { added = { fg = c.green }, modified = { fg = c.orange }, removed = { fg = c.red } },
		padding = { right = 1 },
		symbols = { added = ' ', modified = '柳', removed = ' ' },
	})

	ins_right({
		function()
			return '▊'
		end,
		color = { fg = c.blue },
		padding = { left = 0 },
	})

	require('lualine').setup(config)
end

return M
